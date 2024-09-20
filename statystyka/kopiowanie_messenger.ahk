; Skrypt AutoHotkey do automatycznego kopiowania wiadomości z Messengera

; Określ okno Messengera
SetTitleMatchMode, 2
WinTitle = Messenger

; Sprawdź, czy okno Messengera jest aktywne co 5 sekund
SetTimer, CheckMessenger, 5000
return

CheckMessenger:
IfWinActive, %WinTitle%
{
    ; Skopiuj tekst (Ctrl+C)
    Send, ^c

    ; Poczekaj chwilę, aby upewnić się, że tekst jest skopiowany
    Sleep, 100

    ; Pobierz skopiowany tekst
    ClipSaved := ClipboardAll
    Clipboard =
    Send, ^v
    ClipWait

    ; Zapisz skopiowany tekst do pliku
    FileAppend, %Clipboard%, C:\ścieżka\do\pliku.txt
    Clipboard := ClipSaved
}
return
