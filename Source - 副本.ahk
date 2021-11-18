setAppKey(Key,App)
{
    if WinExist("ahk_exe %App%")
        WinActivate, ahk_exe %App%
    else
        Run, %App%
}

^+o:: setAppKey(1,explorer.exe)     return
^+v:: setAppKey(2,Code.exe)         return
^+g:: setAppKey(3,mintty.exe)       return
^+x:: setAppKey(4,Xshell.exe)       return
^+n:: setAppKey(6,navicat.exe)      return
^+p:: setAppKey(8,phpstorm64.exe)   return
^+m:: setAppKey(9,Postman.exe)      return
^+l:: setAppKey(0,phpstorm64.exe)   return
