$usuarios = Get-LocalUser
$sinLogon= @()
$conLogon = @()

foreach ($u in $usuarios){
    if (-not $u.LastLogon){
        $sinLogon += "$($u.Name) : Estado = $($u.Enabled), Último acceso = NUNCA"
    }else{
        $conLogon += "$($u.Name) : Estado = $($u.Enabled), Último acceso = $($u.LastLogon)"
    } 

}

$sinLogon | Out-File -FilePath "C:\Users\gatit\Documents\scripts\usuarios_sin_logon.txt"
$conLogon | Out-File -FilePath "C:\Users\gatit\Documents\scripts\usuarios_con_logon.txt"

Write-Output " `n Usuarios que NUNCA han iniciado sesión: "
$sinLogon | ForEach-Object{ Write-Output $_ }
Write-Output " `n Usuarios que SI han iniciado sesión: "
$conLogon | ForEach-Object{ Write-Output $_ }