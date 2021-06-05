@echo off
if "%1"=="-elev" (
    powershell -Command "Start-Process cmd -Verb RunAs"
)
if "%1"=="-user" (
        runas /user:%2 cmd
)
if "%1"=="-admin" (
    runas /user:%2 "powershell -Command \"Start-Process cmd -Verb RunAs\""
)
if "%1"=="" (
    echo "sudo -elev -> to open a cmd with elevated privs only if you have administrator rights"
    echo "sudo -user <target user> -> to open cmd as a normal user with normal privs[YOU NEED TO HAVE THE PASSWORD FOR THE TARGET USER ACCOUNT]"
    echo "sudo -admin <target user> -> to open an elevated cmdline with that target user[YOU NEED TO HAVE THE PASSWORD FOR ANY ADMIN USER ACCOUNT]"
)