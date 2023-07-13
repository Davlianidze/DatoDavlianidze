StartState = Class{__includes = BaseState}

function StartState:update(dt)
	if love.keyboard.isDown('return') then
		stateMachine:change('play')
	elseif love.keyboard.isDown('space') then
		Game_restart()
	end
end

function StartState:render()
	love.graphics.setFont(mediumFont)
	love.graphics.printf('Press Enter', 0, 200, 432, 'center')
end
