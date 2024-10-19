#singleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;Gui layout
;-----------------------
;-----------------------

Gui, Show, w300 h250, ComWo  ; Tăng chiều cao để chứa thêm checkbox mới
Gui, Add, Button, cBlue x50 y20 w200 h30 gLaunchGoogle, Apply
Gui, Add, Checkbox, vCamBr x10 y70, Cambridge Dictionary
Gui, Add, Checkbox, vGgoogleTr x10 y100, Google Translate
Gui, Add, Checkbox, vSearch x10 y130, Search text
Gui, Add, Checkbox, vImage x10 y160, Search image
Gui, Add, Checkbox, vVocabCom x10 y190, Search VocabCom
Gui, Add, Checkbox, vPronunciation x10 y220, Search Pronunciation  ; Checkbox mới cho phát âm
return


;Labels
;-----------------------
;-----------------------
GuiClose:
	ExitApp
	return


LaunchGoogle:
	; truyen data từ GUI vào lable
	Gui, Submit, NoHide
	; truyền data từ checkbox vào lable
	GuiControlGet, CamBr,, CamBr
	GuiControlGet, GgoogleTr,, GgoogleTr
	GuiControlGet, Search,, Search
	GuiControlGet, Image,, Image
	GuiControlGet, VocabCom,, VocabCom
	GuiControlGet, Pronunciation,, Pronunciation  ; Lấy trạng thái checkbox mới

	; Gán phím tắt
	Hotkey, ^q, doCambridge, on
	Hotkey, ^e, doGoogleTranslate, on
	Hotkey, ^r, doSearchText, on
	Hotkey, ^g, doSearchImage, on
	Hotkey, ^t, doSearchVocabCom, on
	Hotkey, ^p, doSearchPronunciation, on  ; Gán phím tắt cho phát âm
	return

doCambridge:
	cambridge(CamBr)
	return

doGoogleTranslate:
	googleTranslate(GgoogleTr)
	return

doSearchText:
	SearchText(Search)
	return

doSearchImage:
	SearchImage(Image)
	return
	
doSearchVocabCom:
	SearchVocabCom(VocabCom)
	return

doSearchPronunciation:
	SearchPronunciation(Pronunciation)
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
		sleep, 500
		Run, %link%
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
		Run, %link%
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
		sleep, 500
		Run, %link%
		return
	}else{
		Hotkey, ^t, off
	}
}

SearchPronunciation(checked){
	if(checked = 1){
		first := "https://www.google.com/search?q="
		Clipboard := ClipboardAll 
		send, ^c
		sleep, 500
		link := first Clipboard " pronunciation"
		Run, %link%
		return
	}else{
		Hotkey, ^p, off
	}
}
