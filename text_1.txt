--frost , Sledge , blackbeard , CAPTIO , Tachanka , Castle  , Ash , Thatcher , iQ , Thermite , CAVIERIA , KAPKAN , PULSE

EnablePrimaryMouseButtonEvents  (true);
function OnEvent(event,arg)
    if IsKeyLockOn("capslock")then
        if IsMouseButtonPressed(3)then
            repeat
                if IsMouseButtonPressed(1) then
                    repeat
                        MoveMouseRelative(-0,1)
                        Sleep(9)
                    until not IsMouseButtonPressed(1)
                end
            until not IsMouseButtonPressed(3)
           end
        end
     end
