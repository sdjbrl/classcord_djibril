# Conteneurisation du projet `classcord-server`

## Pourquoi Docker ?

- **Isolation** : Chaque service tourne dans son propre environnement, sans interférer avec le système hôte.
- **Portabilité** : Le projet peut être exécuté facilement sur n’importe quel système (Linux, Windows, macOS).
- **Reproductibilité** : L’environnement est toujours identique grâce au `Dockerfile`.
- **Simplicité** : Plus besoin de configurer Python ou les dépendances manuellement.

---

## Comment build et run le conteneur

### 1. Créer l’image Docker

```bash
docker build -t classcord-server .
```

> Assurez-vous que le `Dockerfile` est dans le même dossier que `server_classcord.py`.

### 2. Lancer le conteneur

```bash
docker run -dit -p 12345:12345 \ -p 54321:54321 classcord-server \ classcord-server
```

- `-dit` : Exécution en arrière-plan (détaché)
- `--name` : Nom du conteneur
- `-p` : Mappage du port

---

## Ports à exposer

Le serveur utilise le port `12345`, mappé depuis le conteneur vers l'hôte :

```
HOST:12345  →  CONTAINER:12345
ADMIN:54321
```

---

## Spécificités VM + NAT

- Dans une **machine virtuelle (VM)** avec **NAT**, il peut être nécessaire de configurer un port forwarding dans VirtualBox ou dans la VM pour accéder à `localhost:12345` depuis l’hôte.
- Exemple : dans VirtualBox > Réseau > Avancé > Redirection de ports :
  - Nom : `classcord`
  - Protocole : TCP
  - Hôte : 12345
  - Invité : 12345
  - Admin : 54321

Cela permet d'accéder à ton serveur depuis l’hôte à l’adresse `127.0.0.1:12345`.

---

## Exemple de test

```bash
nc localhost 12345
{"type": "login", "username": "djib", "password": "test123"}
```