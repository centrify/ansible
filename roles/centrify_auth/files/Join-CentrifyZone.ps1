# Invoke DzJoin.exe to enroll system to Centrify Zone
# Parameters
$Zone = "aasgaard.lab/Centrify/Zones/Global/Windows"
$ServiceAccount = "svc_centrifydzjoin@aasgaard.lab"
$Secret = "Centr1fy"

# Invoke DzJoin.exe
echo $Secret | & 'C:\Program Files\Centrify\Centrify Agent for Windows\DzJoin.exe' /f /r yes /z $Zone /u $ServiceAccount
