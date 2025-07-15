#!/bin/bash

# Demande du nom complet de l'utilisateur
read -p "Nom complet de l'utilisateur : " full_name
if [ -z "$full_name" ]; then
  echo "Nom complet requis. Abandon."
  exit 1
fi

# Nom d'utilisateur court (identifiant)
read -p "Nom court (identifiant) [par défaut : nnosal] : " short_name
short_name=${short_name:-nnosal}

# Demande du mot de passe
read -s -p "Mot de passe : " password
echo
read -s -p "Confirmez le mot de passe : " password_confirm
echo

if [ "$password" != "$password_confirm" ]; then
  echo "Les mots de passe ne correspondent pas. Abandon."
  exit 1
fi

# Demande si l'utilisateur est admin
read -p "Est-ce un administrateur ? (O/n) : " is_admin
is_admin=${is_admin:-O}

# Vérification si l'utilisateur existe déjà
if id "$short_name" &>/dev/null; then
  echo "L'utilisateur '$short_name' existe déjà. Abandon."
  exit 1
fi

# Création de l'utilisateur
echo "Création de l'utilisateur '$short_name'..."

# Création du compte
sudo sysadminctl -addUser "$short_name" -fullName "$full_name" -password "$password"

# Définir l'utilisateur comme admin si demandé
if [[ "$is_admin" =~ ^[OoYy]$ ]]; then
  sudo dseditgroup -o edit -a "$short_name" -t user admin
  echo "L'utilisateur a été ajouté au groupe admin."
fi

echo "Utilisateur '$short_name' ajouté avec succès."
