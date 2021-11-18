openExe(exeName)
{
    winExeName := "ahk_exe " . exeName
    if WinExist(winExeName)
        WinActivate, %winExeName%
    else
        Run, %exeName%
}

^+o:: openExe("explorer.exe")   return
^+v:: openExe("Code.exe")       return
^+g:: openExe("mintty.exe")     return
^+x:: openExe("Xshell.exe")     return
^+n:: openExe("navicat.exe")    return
^+p:: openExe("phpstorm64.exe") return
^+m:: openExe("Postman.exe")    return
^+l:: openExe("msedge.exe")     return
