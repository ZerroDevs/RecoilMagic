--Jackal , mira , echo 1.5X , Glaz, every x1.5 or higher , YING 2X

EnablePrimaryMouseButtonEvents  (true);
function OnEvent(event,arg)
    if IsKeyLockOn("Capslock")then
        if IsMouseButtonPressed(3)then
            repeat
                if IsMouseButtonPressed(1) then
                    repeat
                        MoveMouseRelative(-0.9,3)
                        Sleep(9)
                    until not IsMouseButtonPressed(1)
                end
            until not IsMouseButtonPressed(3)
        end
    end
end
