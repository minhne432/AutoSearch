#NoEnv ; Recommended for performance and compatibility with future AutoHotkey versions.
#SingleInstance force ; Avoids multiple instances of the script running at the same time.

url := "https://dictionary.cambridge.org/dictionary/english/"
^q::
Clipboard := ClipboardAll 
send, ^c
sleep, 100
link := url Clipboard
Run, %link%
return
