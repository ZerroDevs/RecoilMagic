#NoEnv
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

Gui +OwnDialogs
;Gui Color, 0x1E1E1E ; Set the background color to a dark gray
Gui Add, Text, , Select lock key to run the script :  
Gui Add, DropDownList, vLockKey gSetLockKey, Capslock|Numlock|Scrolllock
Gui Add, Text, , Select Exit HotKey : 
Gui Add, Hotkey, vExitHotkey, F12
Gui Add, Button, x+20 y+20 w100 h30 gExitScript, Close Window
Gui Show, w250 h140, Recoil Magic

if ErrorLevel
    MsgBox, 16, Error, Failed to create GUI.

Return

SetLockKey:
    Gui, Submit, NoHide
    return

ExitScript:
    Gui, Submit, NoHide
    if ErrorLevel
    {
        MsgBox, 16, Error, Failed to submit GUI data.
        Return
    }
    Hotkey, %ExitHotkey%, ExitScriptHandler
    Gui Destroy
    return

ExitScriptHandler:
    MsgBox, 0x10, Exit, The Script Has Been Closed, 10
    ExitApp
    return

F12::
    MsgBox, 0x10, Exit, The Script Has Been Closed, 10
    ExitApp
    return

#If GetKeyState(LockKey, "T")

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
    MouseMove, x, y+2, 0
    return

CheckMouse:
    if !GetKeyState("LButton", "P") && !GetKeyState("RButton", "P") {
        SetTimer, MoveMouseDown, Off
        if (WinExist("ahk_class AutoHotkeyGUI") && WinActive("ahk_class AutoHotkeyGUI"))
            SetTimer, CheckMouse, 10
        else
            SetTimer, CheckMouse, Off
    }
    else if (WinExist("ahk_class AutoHotkeyGUI") && !WinActive("ahk_class AutoHotkeyGUI"))
        WinActivate, ahk_class AutoHotkeyGUI
    return

    GuiClose:
    ExitApp
    Return
