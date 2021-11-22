openExe(exeName)
{
    exeNameAhk := "ahk_exe " . exeName
    if WinExist(exeNameAhk)
        if WinActive(exeNameAhk)
            WinMinimize
        else
            WinActivate, %exeNameAhk%
    else
        Run, %exeName%
}

Capslock & e:: Send #e
Capslock & v:: openExe("Code.exe")
Capslock & m:: openExe("mintty.exe")
Capslock & x:: openExe("Xshell.exe")
Capslock & r:: openExe("Another Redis Desktop Manager.exe")
Capslock & n:: openExe("navicat.exe")
Capslock & p:: openExe("phpstorm64.exe")
Capslock & o:: openExe("Postman.exe")
Capslock & i:: openExe("msedge.exe")
Capslock & d:: openExe("TickTick.exe")
Capslock & k:: openExe("KuGou.exe")
Capslock & l:: openExe("Kindle.exe")
