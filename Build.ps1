function Export-ToFantasyGrounds {
    param (
        $directory
    )
    Write-Output "Exporting $directory"
    Push-Location -path $directory
    Start-Process "$directory\Build.bat"
    Pop-Location
}

#export the extensions
foreach ($exportDirectory in (Get-ChildItem ".\extensions\*")) {
    Export-ToFantasyGrounds -directory $exportDirectory
}

#export the modules
foreach ($exportDirectory in (Get-ChildItem ".\modules\*")) {
    Export-ToFantasyGrounds -directory $exportDirectory
}
