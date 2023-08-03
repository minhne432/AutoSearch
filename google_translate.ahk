#NoEnv ; Recommended for performance and compatibility with future AutoHotkey versions.
#SingleInstance force ; Avoids multiple instances of the script running at the same time.

url := "https://translate.google.com/?sl=en&tl=vi&text="
^w::
Clipboard := ClipboardAll 
send, ^c
sleep, 500
link := url Clipboard
Run, %link%
return
