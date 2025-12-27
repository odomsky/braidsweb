$root = "C:\Users\domsk\source\repos\braidsweb\braidsweb\vrkoce.sk"

Write-Host "=========================================="
Write-Host "Removing ?ver=... from HTML files under:"
Write-Host $root
Write-Host "=========================================="
Write-Host ""

Get-ChildItem -Path $root -Recurse -Filter *.html | ForEach-Object {

    $path = $_.FullName
    $original = Get-Content -LiteralPath $path -Raw

    # remove ?ver=xxxx
    $updated = $original -replace '\?ver=[^"'' >]+', ''

    if ($original -ne $updated) {
        Set-Content -LiteralPath $path -Value $updated
        Write-Host "UPDATED:" $path
    }
}

Write-Host ""
Write-Host "DONE"
