#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

Gui +OwnDialogs
Gui Add, Text, , Select lock key to run the script:  
Gui Add, DropDownList, vLockKey gSetLockKey, Capslock|Numlock|Scrolllock
Gui Add, Text, , Select the loop to run:
Gui Add, DropDownList, vLoop gSetLoop, Loop 1|Loop 2
Gui Add, Text, , Select Exit HotKey: 
Gui Add, Hotkey, vExitHotkey, F12
Gui Add, Button, x+20 y+20 w100 h30 gExitScript, Run
Gui Show, w250 h220, Recoil Magic

if ErrorLevel
    MsgBox, 16, Error, Failed to create GUI.

Return

SetLockKey:
    Gui, Submit, NoHide
    return

SetLoop:
    Gui, Submit, NoHide
    return

ExitScript:
    Gui, Hide
    return

    GuiClose:
    ExitApp
    Return

OpenGui:
    Gui, Show, NoActivate
    return

ExitScriptHandler:
    MsgBox, 0x10, Exit, The Script Has Been Closed, 10
    ExitApp
    return

F8::
    GoSub, OpenGui
    return

#If GetKeyState(LockKey, "T")

DllCall("user32.dll\SetMouseVanish", "UInt", 0)

IsKeyLockOn(LockKey) {
    state := GetKeyState(LockKey, "T")
    return state
}



Loop1:
Loop {
    if (GetKeyState("LButton", "P")) {  ; Check if left mouse button is pressed
        Loop {
            ; Move the mouse down two pixels and sleep for 9 milliseconds
            DllCall("user32.dll\mouse_event", "UInt", 1, "Int", 0, "Int", 1, "UInt", 0, "UInt", 0)
            Sleep, 9
        } until (!GetKeyState("LButton", "P"))  ; Stop the loop when left mouse button is released
    }
    else if (!GetKeyState("RButton", "P")) {  ; Stop the loop when right mouse button is released
        break
    }
}
Return



Loop2:
Loop {
    if (GetKeyState("LButton", "P")) {  ; Check if left mouse button is pressed
        Loop {
            ; Move the mouse down two pixels and sleep for 9 milliseconds
            DllCall("user32.dll\mouse_event", "UInt", 1, "Int", 0, "Int", 5, "UInt", 0, "UInt", 0)
            Sleep, 9
        } until (!GetKeyState("LButton", "P"))  ; Stop the loop when left mouse button is released
    }
    else if (!GetKeyState("RButton", "P")) {  ; Stop the loop when right mouse button is released
        break
    }
}
Return

#If (IsKeyLockOn(LockKey))
$RButton::
    Gui, Submit, NoHide
    If (Loop = "Loop 1") {
        GoSub, Loop1
    } else {
        GoSub, Loop2
    }
    return
