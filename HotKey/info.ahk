#NoEnv
SetBatchLines -1

Gui +LastFound
WinSet, Style, -0x40000, A

Gui, Font, s13, Bold, Verdana
Gui, Add, GroupBox, x10 y10 w380 h50, Script1 Operators
Gui, Font, s10, Bold, Verdana
Gui, Add, Text, x20 y30 w360 h60 Multi, frost , Sledge , blackbeard , Captio , Tachanka , Castle  , Ash , Thatcher , iq , Thermite , Caviera , KapKan , Pulse

Gui, Font, s13, Bold, Verdana
Gui, Add, GroupBox, x10 y80 w380 h50, Script2 Operators
Gui, Font, s10, Bold, Verdana
Gui, Add, Text, x20 y100 w360 h60 Multi, Buck , valiykre , ELA , vigil ,DOC , Bandit , Rook , iq , Jeager , Zofia , Smoke , Echo , Fuze , LESION

Gui, Font, s13, Bold, Verdana
Gui, Add, GroupBox, x10 y150 w380 h50, Script3 Operators
Gui, Font, s10, Bold, Verdana
Gui, Add, Text, x20 y170 w360 h60 Multi, Jackal , mira , echo 1.5X , Glaz, every x1.5 or higher , YING 2X

Gui, Font, s13, Bold, Verdana
Gui, Add, GroupBox, x10 y220 w380 h90, Logitech Scripts Copier
Gui, Font, s10, Bold, Verdana
Gui, Add, Text, x20 y240 w360 h60 Multi, Will Add More Operetors Soon . Next Update
Gui, Add, Button, x20 y260 w100 h20 gCopy1, Copy1
Gui, Add, Button, x130 y260 w100 h20 gCopy2, Copy2
Gui, Add, Button, x240 y260 w100 h20 gCopy3, Copy3


Gui, Font, s10, Verdana
Gui, Add, Text, x20 y320 w360 h20, By ZeroNux#1653

Gui, Show, w400 h350, Operator's Info

Return


Copy1:
GitHubLink := "https://raw.githubusercontent.com/ZerroDevs/RecoilMagic/main/pydt/Script1.lua"
FileDelete, %A_Temp%\text_1.txt
URLDownloadToFile, %GitHubLink%, %A_Temp%\text_1.txt
FileRead, content, %A_Temp%\text_1.txt
clipboard := content
FileDelete, %A_Temp%\text_1.txt
MsgBox, % "Logitech Script1 Operators copied to clipboard."
Return

Copy2:
GitHubLink := "https://raw.githubusercontent.com/ZerroDevs/RecoilMagic/main/pydt/Script2.lua"
FileDelete, %A_Temp%\text_2.txt
URLDownloadToFile, %GitHubLink%, %A_Temp%\text_2.txt
FileRead, content, %A_Temp%\text_2.txt
clipboard := content
FileDelete, %A_Temp%\text_2.txt
MsgBox, % "Logitech Script2 Operators copied to clipboard."
Return

Copy3:
GitHubLink := "https://raw.githubusercontent.com/ZerroDevs/RecoilMagic/main/pydt/Script3.lua"
FileDelete, %A_Temp%\text_3.txt
URLDownloadToFile, %GitHubLink%, %A_Temp%\text_3.txt
FileRead, content, %A_Temp%\text_3.txt
clipboard := content
FileDelete, %A_Temp%\text_3.txt
MsgBox, % "Logitech Script3 Operators copied to clipboard."
Return

GuiClose:
ExitApp
Return
