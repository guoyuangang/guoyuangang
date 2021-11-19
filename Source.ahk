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

+f:: openExe("explorer.exe")   return
+v:: openExe("Code.exe")       return
+m:: openExe("mintty.exe")     return
+x:: openExe("Xshell.exe")     return
+r:: openExe("Another Redis Desktop Manager.exe")     return
+n:: openExe("navicat.exe")    return
+p:: openExe("phpstorm64.exe") return
+o:: openExe("Postman.exe")    return
+l:: openExe("msedge.exe")     return
+d:: openExe("TickTick.exe")   return
+g:: openExe("KuGou.exe")      return
+k:: openExe("Kindle.exe")     return
