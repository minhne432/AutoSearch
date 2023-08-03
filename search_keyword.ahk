#NoEnv ; Recommended for performance and compatibility with future AutoHotkey versions.
#SingleInstance force ; Avoids multiple instances of the script running at the same time.

first := "https://www.google.com/search?q="
end := "&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjY9MikqpuAAxUL3WEKHZiSCiEQ_AUoAXoECAIQAw&biw=1347&bih=685&dpr=1.38"
^e::
Clipboard := ClipboardAll 
send, ^c
sleep, 500
link := first Clipboard end
Run, %link%
return