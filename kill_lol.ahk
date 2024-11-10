#Singleinstance

!F4::
{
    ; Check if LoL is running
    if ProcessExist("League of Legends.exe")
    {
        ; If LoL is running, kill the app
        Run "C:\LoLKiller\kill_lol.bat"
    }
    else
    {
        ; If LoL isn't running call the standard window-closing Alt+F4 function
        Send "!{F4}"
    }
}

; Check if the process exists
ProcessExist(procName) {
    try
    {
        ; Use COM !ONLY! when we need to check if process exists
        for proc in ComObject("WbemScripting.SWbemLocator").ConnectServer().ExecQuery("SELECT * FROM Win32_Process WHERE Name = '" procName "'")
            return true
    }
    catch
    {
        ; In case of an error
        return false
    }
    return false
}