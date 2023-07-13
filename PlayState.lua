PlayState = Class{__includes = BaseState}

require('game')

function PlayState:init()
  Interval = 20
  Add_apple()
end

function PlayState:render()
  Game_draw()


  if State == GameStates.pause then
    Game_pause_mesage()
  end


end

function PlayState:update(dt)
  if State == GameStates.running then
    Interval = Interval - 1

    if Interval < 0 then
      Game_update()
      if Tail_length <= 5 then
        Interval = 20
      elseif Tail_length > 5 and Tail_length <= 10 then
        Interval = 15
      elseif Tail_length > 10 and Tail_length <= 5 then
        Interval = 10
      else
        Interval = 5
      end
    end
  end
end

