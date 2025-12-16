$desktopMenuContent = @'
                    <a href="index.html" class="text-slate-700 hover:text-orange-600 font-medium transition-colors">Domov</a>
                    <a href="onas.html" class="text-slate-700 hover:text-orange-600 font-medium transition-colors">O nás</a>
                    <div class="relative group">
                        <button class="flex items-center gap-1 text-slate-700 hover:text-orange-600 font-medium transition-colors">
                            Produkty
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/></svg>
                        </button>
                        <div class="absolute left-0 mt-2 w-64 bg-white rounded-lg shadow-xl opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 max-h-96 overflow-y-auto z-50">
                            <a href="fiber-lasery.html" class="block px-4 py-2 hover:bg-slate-50 transition">Fiber lasery</a>
                            <a href="paliace-stroje.html" class="block px-4 py-2 hover:bg-slate-50 transition">Páliace stroje</a>
                            <a href="3d-rezanie.html" class="block px-4 py-2 hover:bg-slate-50 transition">3D Rezanie</a>
                            <a href="laserove-zvaranie.html" class="block px-4 py-2 hover:bg-slate-50 transition">Laserové zváranie</a>
                            <a href="laserove-znacenie.html" class="block px-4 py-2 hover:bg-slate-50 transition">Laserové značenie</a>
                            <a href="laserove-pracoviska.html" class="block px-4 py-2 hover:bg-slate-50 transition">Laserové pracoviská</a>
                            <div class="border-t my-2"></div>
                            <a href="thermal-dynamics.html" class="block px-4 py-2 hover:bg-slate-50 transition">Thermal Dynamics</a>
                            <a href="kjellberg.html" class="block px-4 py-2 hover:bg-slate-50 transition">Kjellberg</a>
                            <a href="hypertherm.html" class="block px-4 py-2 hover:bg-slate-50 transition">Hypertherm</a>
                            <a href="alfain.html" class="block px-4 py-2 hover:bg-slate-50 transition">Alfain</a>
                            <div class="border-t my-2"></div>
                            <a href="odsavacie-stoly.html" class="block px-4 py-2 hover:bg-slate-50 transition">Odsávacie stoly</a>
                            <a href="filtracie.html" class="block px-4 py-2 hover:bg-slate-50 transition">Filtrácie</a>
                            <a href="spotrebne-diely.html" class="block px-4 py-2 hover:bg-slate-50 transition">Spotrebné diely</a>
                        </div>
                    </div>
                    <a href="downloads.html" class="text-slate-700 hover:text-orange-600 font-medium transition-colors">Na stiahnutie</a>
                    <a href="kontakt.html" class="text-slate-700 hover:text-orange-600 font-medium transition-colors">Kontakt</a>
'@

$mobileMenuContent = @'
            <div class="border-t pt-4">
                <div class="text-xs text-slate-500 font-semibold mb-2 uppercase">Produkty</div>
                <a href="fiber-lasery.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Fiber Lasery</a>
                <a href="paliace-stroje.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Páliace Stroje</a>
                <a href="3d-rezanie.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">3D Rezanie</a>
                <a href="laserove-zvaranie.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Laserové Zváranie</a>
                <a href="laserove-znacenie.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Laserové Značenie</a>
                <a href="laserove-pracoviska.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Laserové Pracoviská</a>
                <a href="thermal-dynamics.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Thermal Dynamics</a>
                <a href="kjellberg.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Kjellberg</a>
                <a href="hypertherm.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Hypertherm</a>
                <a href="alfain.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Alfain</a>
                <a href="odsavacie-stoly.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Odsávacie Stoly</a>
                <a href="filtracie.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Filtrácie</a>
                <a href="spotrebne-diely.html" class="block py-2 pl-4 text-slate-700 hover:text-orange-600">Spotrebné diely</a>
            </div>
'@

$files = Get-ChildItem -Path "c:\Users\henro\Desktop\web2erbos2" -Filter "*.html"

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $currentFile = $file.Name
    
    # Create a specific version of menu for this file
    $thisDesktopMenu = $desktopMenuContent
    $thisMobileMenu = $mobileMenuContent
    
    # Highlight current page
    $activeClassDesktop = ' bg-orange-50 font-semibold hover:bg-orange-100'
    $activeClassMobile = ' bg-orange-50 font-semibold'
    
    # Simple string replacement to add active class
    $thisDesktopMenu = $thisDesktopMenu -replace "href=""$currentFile"" class=""block px-4 py-2 hover:bg-slate-50 transition""", "href=""$currentFile"" class=""block px-4 py-2$activeClassDesktop transition"""
    $thisMobileMenu = $thisMobileMenu -replace "href=""$currentFile"" class=""block py-2 pl-4 text-slate-700 hover:text-orange-600""", "href=""$currentFile"" class=""block py-2 pl-4 text-slate-700 hover:text-orange-600$activeClassMobile"""
    
    # Replace Desktop Menu
    # Regex to match content inside the desktop menu div
    # Matches <div class="hidden lg:flex items-center gap-8"> OR <div class="hidden lg:flex items-center gap-8 desktop-only">
    $desktopRegex = '(?s)(<div class="hidden lg:flex items-center gap-8(?: desktop-only)?">)(.*?)(</div>\s*<!-- CTA Button -->)'
    
    if ($content -match $desktopRegex) {
        $content = $content -replace $desktopRegex, ('$1' + $thisDesktopMenu + '$3')
        Write-Host "Updated Desktop Menu in $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "Desktop Menu not found in $($file.Name)" -ForegroundColor Yellow
    }

    # Replace Mobile Menu
    # Regex to match the products section in mobile menu
    $mobileRegex = '(?s)(<div class="border-t pt-4">.*?</div>)'
    
    if ($content -match $mobileRegex) {
        $content = $content -replace $mobileRegex, $thisMobileMenu
        Write-Host "Updated Mobile Menu in $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "Mobile Menu not found in $($file.Name)" -ForegroundColor Yellow
    }
    
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}
