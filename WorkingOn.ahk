#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

RButton & LButton::
    MouseGetPos, x, y
    SetTimer, MoveMouseDown, 10
return

RButton Up::
    SetTimer, MoveMouseDown, Off
return

LButton Up::
    SetTimer, MoveMouseDown, Off
return

MoveMouseDown:
    MouseGetPos, x, y
    MouseMove, x, y+1, 0
return
