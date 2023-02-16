--buck , val , ELA , vigil ,DOC , Bandit , Rook , iq , Jeager , ZOFIA LMG , SMOKE , ECHO , FUZE , LESION
 
EnablePrimaryMouseButtonEvents  (true);
function OnEvent(event,arg)
    if IsKeyLockOn("Capslock")then
        if IsMouseButtonPressed(3)then
            repeat
                if IsMouseButtonPressed(1) then
                    repeat
                        MoveMouseRelative(-0.9,2)
                        Sleep(9)
                    until not IsMouseButtonPressed(1)
                end
            until not IsMouseButtonPressed(3)
        end
    end
end
