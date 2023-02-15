#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

Gui +OwnDialogs
Gui Add, Text, , Press the key combination to use as the exit hotkey:
Gui Add, Hotkey, vExitHotkey, F12
Gui Add, Button, x+20 y+20 w100 h30 gExitScript, Close Window
Gui Show, w250 h100, Exit Hotkey

if ErrorLevel
    MsgBox, 16, Error, Failed to create GUI.

Return

ExitScript:
Gui, Submit, NoHide
if ErrorLevel
{
    MsgBox, 16, Error, Failed to submit GUI data.
    Return
}
Hotkey, %ExitHotkey%, ExitScriptHandler
Gui Destroy

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

ExitScriptHandler:
MsgBox, 0x10, Exit, The Script Has Been Closed, 10
ExitApp
return

F12::
MsgBox, 0x10, Exit, The Script Has Been Closed, 10
ExitApp
return
