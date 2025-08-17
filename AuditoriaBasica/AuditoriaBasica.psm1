function Obtener-UsuariosInactivos{
    Get-LocalUser| Where-Object { $_.Enabled -eq $true -and -not $_.LastLogon }
}
 
function Obtener-ServiciosExternos {
    Get-Service | Where-Object { $_.Status -eq "Running" -and $_.DisplayName -notmatch "Windows" }
}
 