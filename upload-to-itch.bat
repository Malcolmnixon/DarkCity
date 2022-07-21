SET CURRENT_DIR=%~dp0
SET APK=%CURRENT_DIR%/build/Ataito.apk
SET WINDOWS=%CURRENT_DIR%/build/windows/

echo Uploading to Itch...
butler -v push "%APK%" "malcolmnixon/dark-city:android"
butler -v push "%WINDOWS%" "malcolmnixon/dark-city:windows"

echo Done.
