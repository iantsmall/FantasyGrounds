function Export-ToFantasyGrounds {
    param (
        $directory
    )
    Write-Output "Exporting $directory"
    Push-Location -path $directory
    Start-Process "$directory\Build.bat" -NoNewWindow
    Write-Output $out
    Pop-Location
}

# Get-Command -Name Export-ToFantasyGrounds -Syntax

# Get children of extensions
# Get children of modules
# Combine them into single list
# For each directory, Export-ToFantasyGrounds
foreach ($exportDirectory in (Get-ChildItem ".\extensions\*")) {
    Export-ToFantasyGrounds -directory $exportDirectory
}
foreach ($exportDirectory in (Get-ChildItem ".\modules\*")) {
    Export-ToFantasyGrounds -directory $exportDirectory
}
