#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

#If GetKeyState("Capslock", "T")

RButton & LButton::
    MouseGetPos, x, y
    SetTimer, MoveMouseDown, 10
return

RButton Up::
    SetTimer, MoveMouseDown, Off
    SetTimer, CheckMouse, 10
return

LButton Up::
    SetTimer, MoveMouseDown, Off
    SetTimer, CheckMouse, 10
return

MoveMouseDown:
    MouseGetPos, x, y
    MouseMove, x, y+1, 0
return

CheckMouse:
    if !GetKeyState("LButton", "P") && !GetKeyState("RButton", "P") {
        SetTimer, MoveMouseDown, Off
        SetTimer, CheckMouse, Off
    }
return

#If

