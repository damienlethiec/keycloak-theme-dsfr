# Keycloak DSFR Theme pour Hubee

## Développement local
Pour développer en local il nous faut globalement un container afin de se prémunir un peu des effets néfastes de Shai-Hulud et nous allons tester le thème en local sans keycloak démarré.

Pour cela lancer un container podman ou docker, s'y connecter, installer les dépendances en préservant les versions et mettre en place les variables d'environnement et enfin démarrer le "storybook", accéder aux différentes pages et vérifier le contenu :

```
podman run --rm -ti -v $(pwd):/mnt -p 6006:6006 --entrypoint /bin/sh node:lts-alpine

cd /mnt

yarn install --immutable

### Add env var in keycloak-theme-dsfr/vite.config.ts

npm run storybook
```


Vous pouvez accéder au "storybook" sur la page http://localhost:6006/ par défaut.

Sources :
https://docs.keycloakify.dev/testing-your-theme/outside-of-keycloak
