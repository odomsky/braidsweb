@echo off
setlocal EnableDelayedExpansion

echo ==========================================
echo Removing ?ver=... from HTML files
echo ==========================================
echo.

for /R %%F in (*.html) do (
    set "changed=0"
    set "temp=%%F.tmp"

    >"!temp!" (
        for /f "usebackq delims=" %%L in ("%%F") do (
            set "line=%%L"
            echo !line! | find "?ver=" >nul
            if not errorlevel 1 (
                set "changed=1"
                for /f "tokens=1 delims=?" %%A in ("!line!") do (
                    set "line=%%A"
                )
            )
            echo !line!
        )
    )

    if !changed! EQU 1 (
        echo UPDATED: %%F
        move /y "!temp!" "%%F" >nul
    ) else (
        del "!temp!"
    )
)

echo.
echo ==========================================
echo DONE
echo ==========================================
pause

endlocal
