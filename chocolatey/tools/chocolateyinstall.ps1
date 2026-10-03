$ErrorActionPreference = 'Stop'
if (-not [Environment]::Is64BitOperatingSystem) { throw 'Chessigma requires 64-bit Windows.' }
$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType = 'exe'
  url64bit = 'https://cdn.chessigma.dev/desktop/v1.0.2/Chessigma-Setup-1.0.2-x64.exe'
  checksum64 = '064688203516a2f8bf73c5b4d559fb13e58d8004790a205e3f4a2d65a1da7631'
  checksumType64 = 'sha256'
  silentArgs = '/S'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
