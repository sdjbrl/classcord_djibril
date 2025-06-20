#!/bin/bash

# Configuration
CONTAINER_NAME="classcord-server"
IMAGE_NAME="classcord-server"
SERVER_PORT=12345
ADMIN_PORT=54321

echo "🔁 Vérification du conteneur existant..."
# Supprimer le conteneur s'il existe déjà
if docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    echo "🧹 Suppression de l'ancien conteneur $CONTAINER_NAME..."
    docker rm -f $CONTAINER_NAME
fi

echo "🚀 Lancement du conteneur $CONTAINER_NAME..."
# Lancer le conteneur avec les deux ports exposés
docker run -dit \
    -p ${SERVER_PORT}:${SERVER_PORT} \
    -p ${ADMIN_PORT}:${ADMIN_PORT} \
    --name $CONTAINER_NAME \
    $IMAGE_NAME

sleep 2

echo "🖥️ Ouverture de l'interface admin (port $ADMIN_PORT)..."
if command -v gnome-terminal &> /dev/null; then
    gnome-terminal --title="Interface Admin" -- bash -c "docker exec -it $CONTAINER_NAME python3 /app/admin_cli.py; exec bash"

    sleep 1

    echo "📜 Ouverture du terminal de logs..."
    gnome-terminal --title="Logs Classcord" -- bash -c "docker logs -f $CONTAINER_NAME; exec bash"
else
    echo "⚠️ gnome-terminal non trouvé. Lancez manuellement :"
    echo "   Interface admin : docker exec -it $CONTAINER_NAME python3 /app/admin_cli.py"
    echo "   Logs           : docker logs -f $CONTAINER_NAME"
fi
