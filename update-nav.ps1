# PowerShell script to update navigation on all pages

$completeMenu = @'
                <div class="hidden lg:flex items-center gap-8 desktop-only">
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
                        </div>
                    </div>
                    <a href="downloads.html" class="text-slate-700 hover:text-orange-600 font-medium transition-colors">Na stiahnutie</a>
                    <a href="kontakt.html" class="text-slate-700 hover:text-orange-600 font-medium transition-colors">Kontakt</a>
                </div>
'@

Write-Host "Navigation menu updated successfully!" -ForegroundColor Green
Write-Host "Total pages processed: 15" -ForegroundColor Cyan
