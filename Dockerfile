FROM jakzal/phpqa:alpine

RUN composer global bin phpstan require phpstan/phpstan-deprecation-rules mglaman/phpstan-drupal
