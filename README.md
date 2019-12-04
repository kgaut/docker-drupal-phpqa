# docker-drupal-phpqa

Docker Image for drupal project QA based on https://github.com/jakzal/phpqa

## Added libraries
  - mglaman/phpstan-drupal
  - phpstan/phpstan-deprecation-rules
  
## Gitlab CI integration

Main goal : inspect the code in folder `web/modules/custom`.

```yaml
stages:
  - QA

php-phpmd:
  image: kgaut/drupal-phpqa
  stage: QA
  script: phpmd web/modules/custom text ./files/QA/phpmd.xml
  artifacts:
    paths:
      - files/QA/phpmd.html
  allow_failure: true

php-metrics:
  image: kgaut/drupal-phpqa
  stage: QA
  script: phpmetrics --report-html=files/QA/php-metrics web/modules/custom
  allow_failure: true

php-cs:
  image: kgaut/drupal-phpqa
  stage: QA
  script:
    - phpcs web/modules/custom
  allow_failure: true

phpstan:
  image: kgaut/drupal-phpqa
  stage: QA
  script:
    - phpstan analyse --level 2 web/modules/custom
  allow_failure: true
  ```
