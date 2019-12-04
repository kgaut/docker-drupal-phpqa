FROM jakzal/phpqa:alpine

RUN composer global bin phpstan require phpstan/phpstan-deprecation-rules:0.11.2 mglaman/phpstan-drupal:0.11.12
