#!/bin/bash

echo "Initializing cht-conf"
cht --url=https://morlig:B8NnDhSyxg@localhost delete-all-forms --accept-self-signed-certs

# Convert contact and app forms
cht --url=https://morlig:B8NnDhSyxg@localhost upload-contact-forms convert-app-forms --accept-self-signed-certs

# Upload contact and app forms
cht --url=https://morlig:B8NnDhSyxg@localhost upload-contact-forms upload-app-forms --accept-self-signed-certs

# Backup current app-settings in dir backups
cht --url=https://morlig:B8NnDhSyxg@localhost backup-app-settings --accept-self-signed-certs

# Compile all settings from dir app_settings
cht --url=https://morlig:B8NnDhSyxg@localhost compile-app-settings --accept-self-signed-certs

# Upload translation files from dir translations
cht --url=https://morlig:B8NnDhSyxg@localhost upload-custom-translations --accept-self-signed-certs

# Upload icons and resources files
cht --url=https://morlig:B8NnDhSyxg@localhost upload-resources --accept-self-signed-certs