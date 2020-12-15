#!/bin/bash

# Get CentrifyCLI package from Github 
curl -1sLf 'https://github.com/centrify/centrifycli/releases/download/v1.0.5.0/ccli-v1.0.5.0-linux-x64.tar.gz' -o /tmp/ccli-1.0.5.0.tar.gz
tar -zxvf /tmp/ccli-1.0.5.0.tar.gz -C /opt/centrify/bin
rm /tmp/ccli-1.0.5.0.tar.gz

# Make CentrifyCLI executable and create a symbolic link under /usr/bin
chown root:root /opt/centrify/bin/ccli
chmod +x /opt/centrify/bin/ccli
ln -s /opt/centrify/bin/ccli /usr/bin/ccli

# Add environment variable to turn off globalisation for Dotnet Core
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

# Save Tenant Url from parameter
ccli --url $1 saveConfig
