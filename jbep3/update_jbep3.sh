#!/bin/bash

echo "Updating server..."
steamcmd +force_install_dir ./jbep3_server/ +login anonymous +app_update 869800 verify +quit
echo "Update finished"

