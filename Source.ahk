SetWorkingDir, C:\ProgramFiles\MyPath

openExe(exeName)
{
    exeNameAhk := "ahk_exe " . exeName . ".exe"
    if WinExist(exeNameAhk)
        if WinActive(exeNameAhk)
            WinMinimize
        else
            WinActivate, %exeNameAhk%
    else
        Run, %exeName%
}

Capslock & e:: Send #e
Capslock & v:: openExe("Code")
Capslock & m:: openExe("mintty")
Capslock & x:: openExe("Xshell")
Capslock & r:: openExe("Another Redis Desktop Manager")
Capslock & n:: openExe("navicat")
Capslock & g:: openExe("goland64")
Capslock & p:: openExe("phpstorm64")
Capslock & o:: openExe("Postman")
Capslock & i:: openExe("msedge")
Capslock & d:: openExe("TickTick")
Capslock & k:: openExe("KuGou")
Capslock & l:: openExe("Kindle")
