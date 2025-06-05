# Inception – 42 Paris

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)
![WordPress](https://img.shields.io/badge/WordPress-%23117AC9.svg?style=for-the-badge&logo=WordPress&logoColor=white)

## 📖 Description

Le projet **Inception** consiste à concevoir et déployer une plateforme web complète en utilisant **Docker** et **Docker Compose**. L’objectif est de monter un environnement multiproduit (Nginx, MariaDB, WordPress, phpMyAdmin) entièrement conteneurisé, reproduisant un scénario réaliste de production. Chaque service doit tourner dans son propre conteneur, communiquer via un réseau Docker privé, et respecter les bonnes pratiques de sécurité, de persistance des données et de configuration.

Les principaux objectifs sont :
- Mettre en place une **stack web** avec :
  - **Nginx** comme reverse proxy et serveur HTTP.
  - **MariaDB** pour la base de données.
  - **WordPress** pour le CMS.
  - **phpMyAdmin** pour l’administration de la base de données.
  - Garantir la **persistance des données** via des volumes Docker.
  - Configurer les **certificats SSL/TLS** auto-signés pour le chiffrement HTTPS.
  - Créer un **réseau Docker privé** pour isoler les communications internes.
  - Protéger l’accès aux services par des **droits limités**, des **mots de passe robustes** et des **fichiers de configuration sécurisés**.
  - Automatiser le déploiement et la gestion de l’environnement via un seul fichier `docker-compose.yml`.

Ce projet de monter en compétences dans les domaines suivants: conteneurisation, orchestration, gestion de données persistantes, sécurisation et déploiement d’une stack web complète.

---

## 🛠️ Prérequis

Avant de commencer, assurez-vous d’avoir installé sur votre machine hôte :

- **Git** pour cloner le dépôt.  
- **Docker** (version 20.x ou ultérieure)  
- **Docker Compose** (version 1.27.x ou ultérieure)  
- Un **système UNIX**  

---

## 🚀 Installation & Déploiement

1. **Cloner le dépôt**  
   ```bash
   git clone https://github.com/ElSofian/inception.git
   cd inception
   make
