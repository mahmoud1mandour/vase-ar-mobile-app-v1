@echo off
REM Builds a debug APK on Windows. Needs: Node.js 20+, JDK 21, Android SDK (installed with Android Studio).
REM If ANDROID_HOME is not set, it is guessed from the default Android Studio location.
if "%ANDROID_HOME%"=="" set ANDROID_HOME=%LOCALAPPDATA%\Android\Sdk
echo sdk.dir=%ANDROID_HOME:\=/%> android\local.properties
call npm install || goto :err
call npm run build || goto :err
call npx cap sync android || goto :err
cd android
call gradlew.bat assembleDebug || goto :err
cd ..
echo.
echo DONE. Your APK: android\app\build\outputs\apk\debug\app-debug.apk
pause
exit /b 0
:err
echo.
echo Build failed - see the message above.
pause
exit /b 1
