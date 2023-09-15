$folderPath = "[Replace with your path to Wow\Data\enUS\]"

# Check if realmlist.wtf and realmlist.prod.wtf exist
$realmlistExists = Test-Path "$folderPath\realmlist.wtf"
$realmlistProdExists = Test-Path "$folderPath\realmlist.prod.wtf"

# Check if realmlist.dev.wtf exists
$realmlistDevExists = Test-Path "$folderPath\realmlist.dev.wtf"

if ($realmlistExists -and $realmlistProdExists) {
    Rename-Item "$folderPath\realmlist.wtf" "realmlist.dev.wtf" -Force
    Rename-Item "$folderPath\realmlist.prod.wtf" "realmlist.wtf" -Force
    Write-Host "Switching to production server"
}
elseif ($realmlistExists -and $realmlistDevExists) {
    Rename-Item "$folderPath\realmlist.wtf" "realmlist.prod.wtf" -Force
    Rename-Item "$folderPath\realmlist.dev.wtf" "realmlist.wtf" -Force
    Write-Host "Switching to local dev server"
}
else {
    Write-Host "Files not found or conditions not met"
}
