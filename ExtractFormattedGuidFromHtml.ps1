# HTML dosyasını oku
$htmlContent = Get-Content -Path "dosya_adı.html" -Raw

# GUID'leri bulmak için regex kullan
$guids = [regex]::Matches($htmlContent, 'reports/([a-f0-9-]+)\?experience') | ForEach-Object { $_.Groups[1].Value }

# GUID'leri istenilen formatta birleştir ve panoya kopyala
($guids | ForEach-Object { "`"$_`"" }) -join ",`n" | Set-Clipboard
