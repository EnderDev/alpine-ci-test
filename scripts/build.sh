set -e

REMOTE_URL=$(git remote get-url origin | sed 's/https:\/\/github.com/ghcr.io/')
REMOTE_URL=${REMOTE_URL,,}

docker build -t $REMOTE_URL:latest .
docker tag $REMOTE_URL:latest $REMOTE_URL:latest
docker push $REMOTE_URL:latest