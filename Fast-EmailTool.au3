#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	This Script make it easier to Send Emails

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <Clipboard.au3>

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 518, 487, -992, 172)
$ButtonSend = GUICtrlCreateButton("Senden", 384, 32, 97, 33)
$Label1 = GUICtrlCreateLabel("Empfänger:", 16, 32, 124, 33)
$Input1 = GUICtrlCreateInput("", 152, 32, 185, 21)
$Label2 = GUICtrlCreateLabel("Betreff:", 16, 96, 124, 17)
$Input2 = GUICtrlCreateInput("", 152, 88, 193, 21)
$Label3 = GUICtrlCreateLabel("Text: ", 16, 160, 116, 17)
$Edit1 = GUICtrlCreateEdit("", 24, 200, 473, 257)
GUICtrlSetData(-1, "Edit1")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ButtonSend
			;Local $body = GUICtrlRead($Edit1)
			;MsgBox(0,"Body: ",$body)
	EndSwitch
WEnd
