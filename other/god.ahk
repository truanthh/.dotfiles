#Requires AutoHotkey v2.0

CapsLock::Esc

<!F1:: {
    WinMinimizeAll

    if WinExist("ahk_exe wezterm-gui.exe") {
        WinMinimize("cmd.exe")
    }    

    Return
}

<!`:: {
    if WinExist("ahk_exe powershell.exe") {
        WinActivate()
    }

    Return
}

<!1:: {
    if WinExist("ahk_exe wezterm-gui.exe") {
        WinActivate()
    }

    Return
}

<!2:: {
    if WinExist("ahk_exe firefox.exe") {
        WinActivate()
    }

    Return
}

<!3:: {
    if WinExist("ahk_exe foobar2000.exe") {
        WinActivate()
    }

    Return
}

<!4:: {
    if WinExist("ahk_exe blender.exe") {
        WinActivate()
    }

    Return
}

if WinActive("ahk_exe firefox.exe"){
    ^n::Send("{Down}")
    ^p::Send("{Up}")
}