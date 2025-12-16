
$jsonPath = Join-Path $PSScriptRoot "translations.json"
$translations = Get-Content -Path $jsonPath -Raw -Encoding UTF8 | ConvertFrom-Json

$languages = @("en", "de", "hu")

foreach ($lang in $languages) {
    $targetDir = Join-Path $PSScriptRoot $lang
    if (Test-Path $targetDir) {
        Write-Host "Processing directory: $targetDir"
        $files = Get-ChildItem -Path $targetDir -Filter "*.html"
        
        foreach ($file in $files) {
            Write-Host "  Processing file: $($file.Name)"
            $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
            
            # Get keys and sort them by length descending to prevent partial replacements of longer phrases
            $keys = $translations.PSObject.Properties.Name | Sort-Object { $_.Length } -Descending

            foreach ($key in $keys) {
                $translationObj = $translations.$key
                $translation = $translationObj.$lang
                
                if ($translation) {
                    # Escape special regex characters in the key
                    $escapedKey = [Regex]::Escape($key)
                    
                    # Use word boundaries for short phrases to avoid partial matches
                    if ($key.Length -lt 20) {
                        $pattern = "\b$escapedKey\b"
                    } else {
                        $pattern = $escapedKey
                    }
                    
                    if ($content -match $pattern) {
                        $content = $content -replace $pattern, $translation
                        Write-Host "    Replaced: '$key' -> '$translation'"
                    }
                }
            }
            
            $content | Set-Content -Path $file.FullName -Encoding UTF8
        }
    }
}
