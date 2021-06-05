if ("$args.Count" -ge "0"){
    if ($args[0] -eq "-elev"){
        start-process PowerShell -verb runas
    }
    elseif ($args[0] -eq "-user"){
        $user=$args[1]
        runas /user:$user powershell
    }
    elseif ($args[0] -eq "-admin"){
        $user=$args[1]
        runas /user:$user "powershell.exe -c \"start-process PowerShell -verb runas""
    }
}
else {
    write-host "sudo -elev -> to open a powershell with elevated privs only if you have administrator rights"
    write-host "sudo -user <target user> -> to open cmd as a normal user with normal privs[YOU NEED TO HAVE THE PASSWORD FOR THE TARGET USER ACCOUNT]"
    write-host "sudo -admin <target user> -> to open an elevated cmdline with that target user[YOU NEED TO HAVE THE PASSWORD FOR ANY ADMIN USER ACCOUNT]"
}
