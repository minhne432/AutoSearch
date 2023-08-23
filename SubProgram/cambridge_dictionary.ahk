#NoEnv ; Recommended for performance and compatibility with future AutoHotkey versions.
#SingleInstance force ; Avoids multiple instances of the script running at the same time.

ex := ComObjCreate("Excel.Application")
ex.visible := true
ex.Workbooks.Open("C:\Users\Minh\OneDrive\Desktop\sideproject\autohotkey\auto_dictionary\text.xlsx")

url := "https://dictionary.cambridge.org/dictionary/english/"
^q::
Clipboard := ClipboardAll 
send, ^c
sleep, 100
link := url Clipboard
Run, %link%
sleep,1000
number := ex.Range("A1").text
    ;MsgBox, %number%
    loc1 := "A"
    stt := number + 2
    loc := loc1 stt
    ex.Range(loc).Value := Clipboard
    sleep, 1000
    ex.Range("A1").Value := number + 1
return
