#singleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;Gui layout
;-----------------------
;-----------------------

Gui, Show, w300 h200, ComWo
Gui, Add, Button, cBlue x50 y50 w200 h30 gLaunchGoogle, Apply
Gui, Add, Checkbox, vCamBr, Cambridge Dictionary
Gui, Add, Checkbox, vGgoogleTr, Google Translate
Gui, Add, Checkbox, vSearch, Search text
Gui, Add, Checkbox, vImage, Search image
Gui, Add, Checkbox, vVocabCom, Search VocabCom
return


;Lables
;-----------------------
;-----------------------
GuiClose:
	ExitApp
	return


LaunchGoogle:
	; truyen data từ GUI vào lable
	Gui, Submit, NoHide
	; truyền data từ checkbox vào lable
	GuiControlGet, checked,, CamBr
	GuiControlGet, checked,, GgoogleTr
	GuiControlGet, checked,, Search
	GuiControlGet, checked,, Image
	GuiControlGet, checked,, VocabCom


	Hotkey, ^q, myCambridge, on
	Hotkey, ^e, GoogleTranslate, on
	Hotkey, ^r, SearchText, on
	Hotkey, ^g, SearchImage, on
	Hotkey, ^t, SearchVocabCom, on
	return

	myCambridge:
	cambridge(CamBr)
	return

	GoogleTranslate:
	googleTranslate(GgoogleTr)
	return

	SearchText:
	SearchText(Search)
	return

	SearchImage:
	SearchImage(Image)
	return
	
	SearchVocabCom:
	SearchVocabCom(VocabCom)
	return


;Function
;-----------------------
;-----------------------

cambridge(checked){
	if(checked = 1){
		url := "https://dictionary.cambridge.org/dictionary/english/"
	Clipboard := ClipboardAll 
	send, ^c
	sleep, 100
	link := url Clipboard
	sleep,500
	Run,%link%
	return
}else{
		Hotkey, ^q, off
		
	}

}

googleTranslate(checked){
	if(checked = 1){
	url := "https://translate.google.com/?sl=en&tl=vi&text="
	
	Clipboard := ClipboardAll 
	send, ^c
	sleep, 500
	link := url Clipboard
	Run,%link%
	return
	}else{
	Hotkey, ^e, off
}
}

SearchText(checked) {
	if(checked = 1){
		first := "https://www.google.com/search?q="
		Clipboard := ClipboardAll 
		send, ^c
		sleep, 500
		link := first Clipboard
		Run, %link%
		return
	}else{
		;MsgBox,%checked%
		Hotkey, ^r, off
	}
}

SearchImage(checked){
	if(checked = 1){
	first := "https://www.google.com/search?q="
	end := "&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjY9MikqpuAAxUL3WEKHZiSCiEQ_AUoAXoECAIQAw&biw=1347&bih=685&dpr=1.38"
	Clipboard := ClipboardAll 
	send, ^c
	sleep, 500
	link := first Clipboard end
	Run, %link%
	return
	}else{
		;MsgBox,%checked%
		Hotkey, ^g, off
	}
}

SearchVocabCom(checked){
	if(checked = 1){
		url := "https://www.vocabulary.com/dictionary/"
	Clipboard := ClipboardAll 
	send, ^c
	sleep, 100
	link := url Clipboard
	sleep,500
	Run,%link%
	return
}else{
		Hotkey, ^t, off
		
	}

}
