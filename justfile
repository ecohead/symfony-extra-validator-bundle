# Variables
EXEC := "docker compose exec php"
COMPOSER := EXEC + " composer"
SYMFONY := EXEC + " symfony"

# Aliases
composer +arguments:
  COMPOSER_ALLOW_SUPERUSER=1 {{COMPOSER}} {{arguments}}

console +arguments:
  {{SYMFONY}} console {{arguments}}

cc env='dev':
  {{SYMFONY}} console cache:clear --env={{env}}

test:
  {{EXEC}} php bin/phpunit
