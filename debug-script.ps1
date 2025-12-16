
$file = "c:\Users\henro\Desktop\web2erbos2\en\fiber-lasery.html"
$content = Get-Content -Path $file -Raw -Encoding UTF8
$key = "Maximálna presnosť rezu"
$escapedKey = [Regex]::Escape($key)
Write-Host "Checking for '$key'..."
if ($content -match $escapedKey) {
    Write-Host "Found match!"
} else {
    Write-Host "No match found."
    # Print a snippet to see what's going on
    $snippet = $content | Select-String "Maximálna" -Context 0, 1
    Write-Host "Snippet from file:"
    Write-Host $snippet
}
