$ErrorActionPreference = 'Stop'
$keys = @(Get-UninstallRegistryKey -SoftwareName 'Chessigma*')
if ($keys.Count -gt 1) { throw 'Multiple Chessigma installations found; uninstall the intended one from Windows Settings.' }
if ($keys.Count -eq 0) { Write-Warning 'Chessigma uninstall entry was not found.'; return }
$key = $keys[0]
# NSIS supports /S. Extract the quoted executable without splitting paths at spaces.
$command = $key.UninstallString
if ($command -match '^"([^"\r\n]+)"') { $file = $Matches[1] }
elseif ($command -match '^(.+?\.exe)(?:\s|$)') { $file = $Matches[1] }
else { throw 'Cannot identify the Chessigma uninstaller executable.' }
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'exe' -File $file -SilentArgs '/S' -ValidExitCodes @(0, 3010, 1641)
