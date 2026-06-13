# stop-autopush.ps1
# Script to stop the Git Auto-Push watcher running in the background.

$WatcherPath = "d:/antigravity"
$PidFile = "$WatcherPath/autopush.pid"

if (Test-Path $PidFile) {
    $Pid = Get-Content $PidFile -Raw
    $Process = Get-Process -Id $Pid -ErrorAction SilentlyContinue
    
    if ($Process) {
        Stop-Process -Id $Pid -Force
        Write-Host "Git Auto-Push Watcher stopped successfully (Process $Pid terminated)." -ForegroundColor Green
    } else {
        Write-Host "No active process found with PID $Pid. It may have already stopped." -ForegroundColor Yellow
    }
    
    Remove-Item $PidFile -Force
} else {
    Write-Host "Git Auto-Push Watcher is not currently running." -ForegroundColor Yellow
}
