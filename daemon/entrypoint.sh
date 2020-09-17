# Ensure correct directory
cd /srv/daemon

if [ -f config/core.json ]; then
    echo "Config found. Starting stuff..."
    exec "$@"
else
    echo "No config"
    exit 0
fi
