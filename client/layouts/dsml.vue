<template>
  <div class="dsml-form-layout min-h-screen flex flex-col bg-[#FAF8F5] text-[#1A1A16] font-['Atkinson_Hyperlegible',sans-serif]">
    <!-- Header Institutionnel Mali -->
    <header class="bg-[#FDFCFA] border-b border-[#EAE3D2] sticky top-0 z-40 shadow-xs">
      <div class="max-w-5xl mx-auto px-4 py-3 flex items-center justify-between">
        <a href="https://formulaires.malihub.digital" class="flex items-center gap-3 group">
          <img
            src="/images/logo-mali.svg"
            alt="Armoiries de la République du Mali"
            class="h-11 w-auto object-contain shrink-0"
            width="44"
            height="44"
          />
          <div class="flex flex-col">
            <span class="text-xs uppercase tracking-wider font-semibold text-[#6E5D3F]">
              RÉPUBLIQUE DU MALI
            </span>
            <span class="text-base font-bold font-['Archivo',sans-serif] text-[#1A1A16] group-hover:text-[#0B7A2F] transition-colors">
              Formulaires Mali
            </span>
            <span class="text-[10px] text-[#8A877D]">
              Un Peuple – Un But – Une Foi
            </span>
          </div>
        </a>

        <!-- Liens d'accès rapides inter-services -->
        <nav class="flex items-center gap-4 text-xs font-medium">
          <a
            href="https://formulaires.malihub.digital"
            class="text-[#55534B] hover:text-[#0B7A2F] transition-colors font-medium flex items-center gap-1.5"
          >
            ← Portail des Démarches
          </a>
        </nav>
      </div>


      <!-- Ruban tricolore officiel (Vert - Or - Rouge) -->
      <div class="h-1 w-full grid grid-cols-3">
        <div class="bg-[#0B7A2F]"></div>
        <div class="bg-[#F5C518]"></div>
        <div class="bg-[#CE2029]"></div>
      </div>
    </header>

    <!-- Zone Principale du Formulaire (DSML Card Layout) -->
    <main class="flex-grow flex flex-col py-8 px-4 sm:px-6">
      <div class="w-full max-w-3xl mx-auto bg-white border border-[#EAE3D2] rounded-xl shadow-xs p-6 sm:p-10">
        <slot />
      </div>
    </main>

    <!-- Footer Institutionnel Mali -->
    <footer class="bg-[#121E17] text-[#D8EBDC] border-t border-[#0A3D1C] mt-auto py-8">
      <div class="max-w-5xl mx-auto px-4 flex flex-col md:flex-row items-center justify-between gap-6 text-xs">
        <div class="flex items-center gap-3 text-center md:text-left">
          <div class="flex flex-col">
            <span class="font-bold font-['Archivo',sans-serif] text-white uppercase tracking-wider">
              RÉPUBLIQUE DU MALI
            </span>
            <span class="text-[#9CC7A8] mt-0.5">
              Service public numérique de démarches et formulaires administratifs
            </span>
            <span class="text-[#55AA6F] text-[11px] mt-1">
              Plateforme hébergée dans le cadre des services numériques Malihub
            </span>
          </div>
        </div>

        <div class="flex flex-wrap items-center justify-center gap-5 text-[#9CC7A8]">
          <a href="https://dsml.malihub.digital" target="_blank" rel="noopener noreferrer" class="hover:text-white transition-colors">
            Design System (DSML)
          </a>
          <a href="https://sites.malihub.digital" class="hover:text-white transition-colors">
            Sites Faciles
          </a>
          <a href="https://formulaires.malihub.digital" class="hover:text-white transition-colors">
            Portail Démarches
          </a>
        </div>

      </div>
    </footer>
  </div>
</template>

<script setup>
</script>
