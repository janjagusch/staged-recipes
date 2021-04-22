set "BINARY_HOME=%PREFIX%\bin"
mkdir "%BINARY_HOME%" || goto :error
move hadolint-Windows-x86_64.exe "%BINARY_HOME%\hadolint.exe"
goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
