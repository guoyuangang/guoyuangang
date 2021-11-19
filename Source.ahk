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

+e:: Send #e
+v:: openExe("Code.exe")
+m:: openExe("mintty.exe")
+x:: openExe("Xshell.exe")
+r:: openExe("Another Redis Desktop Manager.exe")
+n:: openExe("navicat.exe")
+p:: openExe("phpstorm64.exe")
+o:: openExe("Postman.exe")
+i:: openExe("msedge.exe")
+d:: openExe("TickTick.exe")
+k:: openExe("KuGou.exe")
+l:: openExe("Kindle.exe")
