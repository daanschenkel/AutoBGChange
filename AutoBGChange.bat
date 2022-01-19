@echo off
copy "%~n0%~x0" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
cls
echo  "    _         _        ____   ____  ____ _                            "
echo  "   / \  _   _| |_ ___ | __ ) / ___|/ ___| |__   __ _ _ __   __ _  ___ "
echo  "  / _ \| | | | __/ _ \|  _ \| |  _| |   | '_ \ / _` | '_ \ / _` |/ _ \"
echo  " / ___ | |_| | || (_) | |_) | |_| | |___| | | | (_| | | | | (_| |  __/"
echo  "/_/   \_\__,_|\__\___/|____/ \____|\____|_| |_|\__,_|_| |_|\__, |\___|"
echo  "                                                           |___/      "
echo Made by DannyDanDan
echo https://github.com/daanschenkel
echo.
echo Special thanks to https://github.com/tobimori/unsplash-wallpaper/
echo. 
mkdir %temp%\autobgchange
cd %temp%\autobgchange


powershell -Command "Invoke-WebRequest https://github.com/stbrenner/SilentCMD/releases/latest/download/SilentCMD.zip -OutFile scmd.zip"
powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('%temp%\autobgchange'); $zip = $shell.NameSpace('%temp%\autobgchange\scmd.zip'); $target.CopyHere($zip.Items(), 16); }"

powershell -Command "Invoke-WebRequest https://github.com/tobimori/unsplash-wallpaper/releases/download/v1.2/unsplash-wallpaper-win.zip -OutFile package.zip"
powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('%temp%\autobgchange'); $zip = $shell.NameSpace('%temp%\autobgchange\package.zip'); $target.CopyHere($zip.Items(), 16); }"
echo cd %temp%\autobgchange > main.bat
echo :loop >> main.bat
echo %temp%\autobgchange\unsplash-wallpaper.exe >> main.bat
echo timeout /t 60 >> main.bat
echo goto loop >> main.bat

start SilentCMD main.bat
