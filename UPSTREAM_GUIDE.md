# Protocole de Synchronisation Upstream (OpnForm)

Ce document décrit le protocole de maintenance et de mise à jour d'OpnForm dans le dépôt `malihub/forms`.

---

## 🎯 Philosophie du Dépôt

1. **Isolation stricte** : Aucun fichier de documentation interne (`.dev/`) ni vitrine marketing/landing page n'est présent dans ce dépôt. La landing page est déportée sur `forms-portal` (`https://formulaires.malihub.digital`).
2. **Redirection automatique** : La racine `/` d'OpnForm est redirigée via la variable d'environnement native `NUXT_PUBLIC_ROOT_REDIRECT_URL=https://formulaires.malihub.digital` sans altérer `client/pages/index.vue`.
3. **Modifications chirurgicales** :
   - `docker-compose.yml` & `dokploy.json` : configuration Dokploy et build du client.
   - `client/css/app.css` : variables de couleurs DSML (vert malien `#0B7A2F`, or `#F5C518`), polices `Archivo` et `Atkinson Hyperlegible`, et styles d'inputs républicains.
   - `client/layouts/dsml.vue` & `client/pages/forms/[slug]/index.vue` : habillage institutionnel officiel pour les formulaires publics.
   - `client/middleware/setup-redirect.global.js` : exemption des formulaires publics lors du wizard initial.

---

## 🌿 Structure des Branches

- **`vendor/upstream`** : Miroir 100% pur de la branche `main` d'OpnForm (`upstream/main`). Aucun commit personnalisé n'y est fait.
- **`main`** : Branche de développement Malihub contenant uniquement les commits chirurgicaux DSML/Dokploy rebasés sur `vendor/upstream`.
- **`prod`** : Branche déployée en continu par Dokploy Malihub (`deploy.malihub.digital`).

---

## 🔄 Procédure de Mise à Jour (Automatisée)

Pour synchroniser le fork avec la dernière version officielle d'OpnForm :

```bash
./scripts/sync-upstream.sh
```

Le script exécute les étapes suivantes :
1. Récupère les derniers commits depuis `https://github.com/OpnForm/OpnForm.git`.
2. Met à jour la branche miroir `vendor/upstream` en avance rapide (`fast-forward`).
3. Rebase notre branche `main` sur `vendor/upstream`.
4. Rebase la branche `prod` sur `main`.

Après validation locale, pousser les branches :
```bash
git push origin main prod vendor/upstream --force-with-lease
```

---

## 🛠️ Résolution d'éventuels conflits de Rebase

Si un conflit survient lors du rebase (par exemple si `client/pages/forms/[slug]/index.vue` ou `client/css/app.css` a été remanié par OpnForm) :

1. Inspecter le conflit :
   ```bash
   git status
   ```
2. Conserver les blocs DSML (notamment l'encadrement `NuxtLayout` ou les variables `@theme`).
3. Continuer le rebase :
   ```bash
   git add <fichier-résolu>
   git rebase --continue
   ```
