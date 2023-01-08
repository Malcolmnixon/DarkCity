SET CURRENT_DIR=%~dp0
SET APK=%CURRENT_DIR%/build/quest/DarkCity.apk
SET WINDOWS=%CURRENT_DIR%/build/windows/
SET WEBXR=%CURRENT_DIR%/build/webxr/

echo Uploading to Itch...
butler -v push "%APK%" "malcolmnixon/dark-city:android"
butler -v push "%WINDOWS%" "malcolmnixon/dark-city:windows"
butler -v push "%WEBXR%" "malcolmnixon/dark-city:html5"

echo Done.
