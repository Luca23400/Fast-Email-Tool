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
#include <Crypt.au3>
#include <Inet.au3>

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Mail", 518, 487, -992, 172)
$ButtonSend = GUICtrlCreateButton("Senden", 384, 32, 97, 33)
$Label1 = GUICtrlCreateLabel("Empfänger:", 16, 32, 124, 33)
$InputReceiver = GUICtrlCreateInput("", 152, 32, 185, 21)
$Label2 = GUICtrlCreateLabel("Betreff:", 16, 96, 124, 17)
$InputSubject = GUICtrlCreateInput("", 152, 88, 193, 21)
$Label3 = GUICtrlCreateLabel("Text: ", 16, 160, 116, 17)
$Edit1 = GUICtrlCreateEdit("", 24, 200, 473, 257)
GUICtrlSetData(-1, "Edit1")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

; Konfigurieren des Absenders
Global $INIFile = @ScriptDir & "\Konfiguration.txt"
Global $key = 197
_ClipBoard_SetData($INIFile)
Global $YourMail = IniRead($INIFile,"Konfiguration","E-Mail","nichts gefunden")
Global $YourName = IniRead($INIFile,"Konfiguration","Name","nichts gefunden")
Global $YourPassword = IniRead($INIFile,"Konfiguration","Passwort","Passwort nicht gefunden")
Global $decryptPassword = BinaryToString(_Crypt_DecryptData($YourPassword,$key,$CALG_3DES))
Global $server = "smtp.web.de"
;MsgBox(0,"Verschlüsseltes Password:",$YourPassword)
;MsgBox(0,"Entschlüsseltes Password:",$decryptPassword)


;Passwort verschlüsselt speichern
if $YourPassword == "" Then
	Local $input = InputBox("Eingabeaufforderung", "Bitte geben Sie ihr Passwort ein:", "")
	Local $passwortCrypt = _Crypt_EncryptData($input,$key,$CALG_3DES)
	MsgBox(0,"",$passwortCrypt)
	IniWrite($INIFile,"Konfiguration","Passwort",$passwortCrypt)
EndIf

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ButtonSend
			Local $receiver = GUICtrlRead($InputReceiver)
			Local $subject = GUICtrlRead($InputSubject)
			Local $body = GUICtrlRead($Edit1)
			Local $iReponse = _INetSmtpMail($server,$YourName,$YourMail,$receiver,$subject,$body)
			if $iReponse = 1 then
				MsgBox(0,"","Email gesendet")
			else
				MsgBox(0,"","Fehler beim senden")

			;MsgBox(0,"Empfänger:",$receiver)
			;MsgBox(0,"Betreff: ",$subject)
			;MsgBox(0,"Text:",$body)
	EndSwitch
WEnd