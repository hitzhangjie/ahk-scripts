; MsgBox Format("The version of this script is {1}", A_ahkVersion)

; -----------------------------------------------------------------
; WARN: Please consider `Windows PowerToys` instead of AHK,
;       if you need to customize few keymapping.
; 
; AHK is better for users that needs to customize a lot, for example:
; - keymapping (which PowerToys isn't capable of)
; - snippets (snippets for coding, url, cmds, etc)
; - workflow (define complex workflow)
; - etc.
;
;
; AHK common chars to represent the modifier keys is as following:
; - #: Command/Windows
; - !: Alt 
; - +: Shift
; - ^: Ctrl
; -----------------------------------------------------------------

; Starts new terminal
^!t::{
    Run 'wt.exe new-tab -p OracleLinux_8_5 -d ~'
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Disable Windows builtin shortcuts (win+arrowkeys)
#Right::return
#Left::return
#Up::return
#Down::return

; Remap hotkeys for switching desktops
^!Left::^#Left
^!Right::^#Right

; Switch input language quickly like macOS (Command+Space)
!Space::Send "#{Space}"

; Show taskviews
#w::Send "{LWin down}{Tab}{LWin up}"

; Close window
!q::Send "!{F4}"

; Resize and center 
^#Enter::ResizeAndCenter()

; Maximize window
^#Up::WinMaximize "A"

; Minimize window
^#Down::WinMinimize "A"

; Tile to the left
^#Left::TileLeft()

; Tile to the right
^#Right::TileRight()

; Resize and center window
ResizeAndCenter()
{
    ; Get screen resolution
    screenWidth := SysGet(0)
    screenHeight := SysGet(1)

    ; Define new window size
    newWidth := screenWidth * 0.67
    newHeight := screenHeight * 0.67

    ; Center window
    newLeft := (screenWidth - newWidth) / 2
    newTop := (screenHeight - newHeight) / 2

    ; Get current window state
    windowState := SysGet(4)

    ; If window is maximized, restore it
    if (windowState == 34) {
        WinRestore "A"
    }

    ; Resize and move window
    WinMove newLeft, newTop, newWidth, newHeight, "A"
}

; Tile window to the right
TileLeft()
{
    ; Get screen resolution
    ; 0: screen width, 1: screen height, 30: taskbar height, 
    screenWidth := SysGet(0)
    screenHeight := SysGet(1) - SysGet(30) - 16

    ; Get current window state
    ; If window is maximized, restore it
    windowState := SysGet(4)
    if (windowState == 34) {
        WinRestore "A"
    }

    ; Tile to the left
    WinMove 0, 0, screenWidth/2, screenHeight, "A"
}

; Tile window to the left
TileRight()
{
    ; Get screen resolution (height=screenHeight-taskbarHeight)
    screenWidth := SysGet(0)
    screenHeight := SysGet(1) - SysGet(30) - 16

    ; Get current window state
    ; If window is maximized, restore it
    windowState := SysGet(4)
    if (windowState == 34) {
        WinRestore "A"
    }

    ; Tile to the right
    WinMove screenWidth/2, 0, screenWidth/2, screenHeight, "A"
}

; --------------------------------------------------------------------------- ;
;        using PowerToys keyboard manager instead of following macros         ;
; --------------------------------------------------------------------------- ;

; Home/End/PageUp/PageDown
;    !Left::Home
;    !Right::End
;    !Up::PgUp
;    !Down::PgDn

; Selection text quickly
; -- select previous or next word (ctrl+shift+left / ctrl+shift+right)
; -- select to the beginning or end of line (alt+shift+left or alt+shift+right)
;    +!Left::+Home 
;    +!Right::+End
; -- select to the beginning or end of paragraph
;    +!Up::^+Up
;    +!Down::^+Down
