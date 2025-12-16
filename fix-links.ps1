
$languages = @("en", "de", "hu")

foreach ($lang in $languages) {
    $targetDir = Join-Path $PSScriptRoot $lang
    if (Test-Path $targetDir) {
        Write-Host "Processing directory: $targetDir"
        $files = Get-ChildItem -Path $targetDir -Filter "*.html"
        
        foreach ($file in $files) {
            $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
            
            if ($content -match 'href="Kontakt.html"') {
                Write-Host "Found Kontakt.html in $($file.Name)"
            }

            $newContent = $content -replace 'href="Contact.html"', 'href="kontakt.html"'
            $newContent = $newContent -replace 'href="Kapcsolat.html"', 'href="kontakt.html"'
            $newContent = $newContent -replace 'href="Kontakt.html"', 'href="kontakt.html"'
            
            if ($content -cne $newContent) {
                $newContent | Set-Content -Path $file.FullName -Encoding UTF8
                Write-Host "  Updated links in: $($file.Name)"
            }
        }
    }
}
