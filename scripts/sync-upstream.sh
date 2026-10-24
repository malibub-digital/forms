#!/usr/bin/env bash
# ==============================================================================
# Script de Synchronisation avec OpnForm Upstream
# Usage: ./scripts/sync-upstream.sh
# ==============================================================================
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_DIR"

echo "==> 1. Vérification des remotes Git..."
if ! git remote | grep -q "^upstream$"; then
    echo "Ajout du remote upstream..."
    git remote add upstream https://github.com/OpnForm/OpnForm.git
fi

echo "==> 2. Récupération des nouveautés depuis upstream..."
git fetch upstream main

echo "==> 3. Mise à jour de la branche vendor/upstream propre..."
git checkout vendor/upstream
git merge --ff-only upstream/main

echo "==> 4. Rebase de la branche main par-dessus vendor/upstream..."
git checkout main
git rebase vendor/upstream

echo "==> 5. Synchronisation de la branche de production Dokploy (prod)..."
git checkout prod
git rebase main

git checkout main

echo "---------------------------------------------------------------"
echo "✅ Synchronisation terminée avec succès !"
echo "Pour pousser vers origin (GitHub) :"
echo "  git push origin main prod vendor/upstream --force-with-lease"
echo "---------------------------------------------------------------"
