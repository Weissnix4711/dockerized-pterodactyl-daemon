#!/bin/bash

# Down all containers
docker-compose down

# Remove daemon data
sudo rm -rf daemon/data/*
sudo rm -rf daemon/tmp/*
sudo rm -rf daemon/config/*