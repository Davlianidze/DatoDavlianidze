GameOverState = Class{__includes = BaseState}

function GameOverState:render()
    love.graphics.printf(
      "Game Over - Press space to restart",
      0,
      200,
      love.graphics.getWidth(),
      "center"
    )

    if love.keyboard.isDown('space') then
        stateMachine:change('start')
    end
end