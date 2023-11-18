; MsgBox Format("The version of this script is {1}", A_ahkVersion)

; =========================================
; snippets for date and time
; =========================================

:://date:: {
    CurrentDateTime := FormatTime(, "yyyy-MM-dd")
    SendInput CurrentDateTime
    return
}

:://datetime:: {
    CurrentDateTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    SendInput CurrentDateTime
    return
}

:://time:: {
    CurrentDateTime := FormatTime(, "HH:mm:ss")
    SendInput CurrentDateTime
    return
}

; =========================================
; snippets for github
; =========================================

:://repo:: {
    SendInput "https://github.com/hitzhangjie"
    return
}

; snippets for github
:://github:: {
    SendInput "https://github.com"
    return
}

; snippets for github golang/go
:://go:: {
    SendInput "https://github.com/golang/go"
    return
}

; snippets for github torvalds/linux
:://linux:: {
    SendInput "https://github.com/torvalds/linux"
    return
}

; snippets for github go-delve/delve
:://dlv:: {
    SendInput "https://github.com/go-delve/delve"
    return
}

; =========================================
; snippets for blog
; =========================================

:://blog:: {
    SendInput "https://www.hitzhangjie.pro"
    return
}

; =========================================
; snippets for blog
; =========================================
:://post:: {
    CurrentDateTime := FormatTime(, "yyyy-MM-dd HH:mm:ss")
    Send "layout: post`{Enter}"
    Send 'title: ""{Enter}'
    Send 'description: ""{Enter}'
    Send Format("date: {1} {+}0800{Enter}", CurrentDateTime)
    Send 'tags: [""]{Enter}'
    Send 'toc: true{Enter}'
    Send 'reward: true{Enter}'
    return
}

; =========================================
; snippets for AI relevant
; =========================================
