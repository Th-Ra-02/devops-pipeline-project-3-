echo "Building branch: $GIT_BRANCH"

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

if echo "$GIT_BRANCH" | grep -q "dev"; then
    echo "DEV BUILD"
    ./build.sh

elif echo "$GIT_BRANCH" | grep -q "master"; then
    echo "PROD BUILD"
    docker build -t thra21/prod:latest .
    docker push thra21/prod:latest
fi
