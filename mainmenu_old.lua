-- -*- compile-command: "\"c:/Program Files/LOVE/love.exe\" ."; -*-

mainmenu_old = {}



function mainmenu_old:enter()
   mainmenu_old.menu = MenuHelper.new()
   mainmenu_old.menu.menutop = 120
   mainmenu_old.menu.menuheight = 30   mainmenu_old.menu.menuthreshold = 10
   mainmenu_old.menu:add("P L A Y", function() Gamestate.switch(labyrinth, 1)  end)
   mainmenu_old.menu:add("LEVELS", function() Gamestate.switch(mainmenu)  end)
   mainmenu_old.menu:add("MUSIC: ON", toggleBackgroundMusic)
   mainmenu_old.menu:add("FULLSCREEN: OFF", toggleFullscreen)
   mainmenu_old.menu:add("CREDITS", function() Gamestate.switch(credits)  end)
   mainmenu_old.menu:add("UIT GAME", function() love.event.quit()  end)

end

function draw_menu_bg()
   love.graphics.draw(imgDefaultBg, imgDefaultBgQuad, 0,0, 0, 1,1)
   love.graphics.setColor(255,0,0,150);
   love.graphics.circle( "fill", canvasWidth/4*1, canvasHeight/5*4, canvasWidth/5, canvasHeight/5)
   
   love.graphics.setColor(255,255,0,150);
   love.graphics.circle( "fill", canvasWidth/1*1, canvasHeight/1*0, canvasWidth/4, canvasHeight/4)
   
   love.graphics.setColor(0,0,255,150);
   love.graphics.circle( "fill", canvasWidth/3*2, canvasHeight/3*2, canvasWidth/8, canvasHeight/8)

   love.graphics.setColor(0,255,0,150);
   love.graphics.circle( "fill", canvasWidth/2, canvasHeight/4*3, canvasWidth/6, canvasHeight/8)

end

function mainmenu_old:draw()
   draw_menu_bg()

   love.graphics.setColor(255,255,255)
   love.graphics.setFont(fntTitle)
   love.graphics.print("Welcome to MAZE SHIFT !", 100, 50)
   
   love.graphics.setFont(fntDefault)
   
   if blinkyvis then love.graphics.print("Main Menu", 100, 100) end
   mainmenu_old.menu:draw()
end


blinkytimer = 0   blinkyvis = false   mouselasty = 0
function mainmenu_old:update(dt)
   blinkytimer = blinkytimer + dt
   if blinkytimer > 0.4 then
      blinkyvis = not blinkyvis
      blinkytimer = blinkytimer - 0.4
   end
   mainmenu_old.menu:update(dt)
end

function mainmenu_old:mousereleased(x, y, button)
   mainmenu_old.menu:mousereleased(x, y, button)
end

function mainmenu_old:keypressed(key)
   mainmenu_old.menu:keypressed(key)
   if key == "q" then
      love.event.quit()
   end
end

