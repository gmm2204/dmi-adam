#!/bin/bash

echo "Initializing cht-conf"
cht --url=https://morlig:B8NnDhSyxg@adamtest.icapkenya.org delete-all-forms

# Convert contact and app forms
cht --url=https://morlig:B8NnDhSyxg@adamtest.icapkenya.org convert-contact-forms convert-app-forms

# Upload contact and app forms
cht --url=https://morlig:B8NnDhSyxg@adamtest.icapkenya.org upload-contact-forms upload-app-forms

# Backup current app-settings in dir backups
cht --url=https://morlig:B8NnDhSyxg@adamtest.icapkenya.org backup-app-settings

# Compile all settings from dir app_settings
cht --url=https://morlig:B8NnDhSyxg@adamtest.icapkenya.org compile-app-settings

# Upload translation files from dir translations
cht --url=https://morlig:B8NnDhSyxg@adamtest.icapkenya.org upload-custom-translations

# Upload icons and resources files
cht --url=https://morlig:B8NnDhSyxg@adamtest.icapkenya.org upload-resources