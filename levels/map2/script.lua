local maphandler = {}

function maphandler:onLoad()
   darkeneralpha = 220
   
   pushhelp("Press SPACE to switch players")
   pushhelp("Collect stars to get credits or superpowers")
   pushhelp("Collect all the cherries to win the level")
   pushhelp("Don't run into the skulls, they'll kill you")
end

function maphandler:onCollision(direction, mapchar, player, tx, ty, playerIndex)
   print("onCollision", direction, mapchar, player, tx, ty, playerIndex)

   if mapchar == "t" and direction == "enter" then playerDied() end
   
   if direction == "enter" and (mapchar == "r" or mapchar == "y" or mapchar == "b") and player.player == mapchar then
      sndBackgroundmusic:pause() sndCredit:play() labyrinth:credit(100)
      
      if mapchar == "y" then
         setTimeout(function() labyrinth.show_map = false end, 1) labyrinth.show_map=true
      end
      if mapchar == "b" then
         setTimeout(function() labyrinth.disable_hittest = false killOnHit() refreshMap() end, 3)  labyrinth.disable_hittest = true refreshMap()
      end
   end
   
   
end

maphandler.imagemap = {
   r = { imgStar, consume = true, player="r", inactiveColor = {111,111,111,111} },
   y = { imgStar, consume = true, player="y", inactiveColor = {111,111,111,111} },
   b = { imgStar, consume = true, player="b", inactiveColor = {111,111,111,111} },
   t = { love.graphics.newImage("images/death.png"), player="r", inactiveColor = {0,0,0,0} }
}

maphandler.players = {
   { player = "red", x = 3, y = 3, directionvector = {1,0} },
   { player = "yellow", x = 30, y = 3, directionvector = {-1,0} },
   { player = "blue", x = 3, y = 15, directionvector = {0,-1} },
}

return maphandler
