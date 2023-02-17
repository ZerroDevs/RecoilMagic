#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force ; Ensures only one instance of the script is running at a time.

SendMode Input
SetWorkingDir %A_ScriptDir%

Gui +OwnDialogs
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

DllCall("user32.dll\SetMouseVanish", "UInt", 0)  ; Enable primary mouse button events

IsKeyLockOn(LockKey) {
    state := GetKeyState(LockKey, "T")
    return state
}

; Main event loop
#If (IsKeyLockOn(LockKey))  ; Apply this hotkey modifier only if Numlock is on
$RButton::
    Loop {
        if (GetKeyState("LButton", "P")) {  ; Check if left mouse button is pressed
            Loop {
                ; Move the mouse down two pixels and sleep for 9 milliseconds
                DllCall("user32.dll\mouse_event", "UInt", 1, "Int", 0, "Int", 3, "UInt", 0, "UInt", 0)
                Sleep, 9
            } until (!GetKeyState("LButton", "P"))  ; Stop the loop when left mouse button is released
        }
        else if (!GetKeyState("RButton", "P")) {  ; Stop the loop when right mouse button is released
            break
        }
    }
Return
