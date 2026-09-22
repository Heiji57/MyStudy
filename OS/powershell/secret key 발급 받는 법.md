\$rng = \[System.Security.Cryptography.RandomNumberGenerator\]::Create()<br>\$bytes = New-Object byte\[\] 64<br>\$rng.GetBytes(\$bytes)
\[Convert\]::ToBase64String(\$bytes)
