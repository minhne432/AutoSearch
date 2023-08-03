#NoEnv ; Recommended for performance and compatibility with future AutoHotkey versions.
#SingleInstance force ; Avoids multiple instances of the script running at the same time.

first := "https://www.google.com/search?q="
^r::
Clipboard := ClipboardAll 
send, ^c
sleep, 500
link := first Clipboard
Run, %link%
return