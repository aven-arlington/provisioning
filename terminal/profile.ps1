$PSStyle.FileInfo.Directory = "`e[34m"

function prompt {
    $BRANCH = git branch --show-current
    Write-Host "PS " -NoNewline -ForegroundColor White
    If ($BRANCH -ne $NULL){
        Write-Host $($executionContext.SessionState.Path.CurrentLocation) -NoNewline -ForegroundColor White
        Write-Host " ($BRANCH) " -ForegroundColor Blue
    } else {
        Write-Host $($executionContext.SessionState.Path.CurrentLocation) -ForegroundColor White
    }
    $(Write-Host $('>' * ($NestedPromptLevel + 1)) -NoNewline -ForegroundColor White)
    return " "
}

$path = "$Env:UserProfile\.venv\Scripts\activate.ps1"
if (Test-Path -Path $path) {
    Invoke-Expression $path
}