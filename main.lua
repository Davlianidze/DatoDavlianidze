Class = require 'class'

require 'StateMachine'

require 'BaseState'
require 'StartState'
require 'PlayState'
require 'GameOverState'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Nokia Snake')

    miniFont = love.graphics.newFont('abc.ttf', 20)
    mediumFont = love.graphics.newFont('abc.ttf', 32)
    

    stateMachine = StateMachine {
		['start'] = function() return StartState() end,
		['play'] = function() return PlayState() end,
        ['over'] = function() return GameOverState() end
	}

    stateMachine:change('start')
end

function love.update(dt)
    stateMachine:update(dt)
end

function love.draw()
    stateMachine:render()
end


function love.keypressed(key)
    if key == 'escape' then
      love.event.quit()
    elseif key == 'left' and State == GameStates.running then
      Left, Right, Up, Down = true, false, false, false
    elseif key == 'right' and State == GameStates.running then
      Left, Right, Up, Down = false, true, false, false
    elseif key == 'up' and State == GameStates.running then
      Left, Right, Up, Down = false, false, true, false
    elseif key == 'down' and State == GameStates.running then
      Left, Right, Up, Down = false, false, false, true
    elseif key == 'space' and State == GameStates.game_over then
      Game_restart()
    elseif key == 'p' then
      if State == GameStates.running then
        State = GameStates.pause
      elseif stateMachine:change('over') then
        State = GameStates.running
      end
    end
  end
