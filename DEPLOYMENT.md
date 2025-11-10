# Déploiement du thème Keycloak DSFR

## 🚀 Installation en recette

### 1. Build du thème
```bash
yarn install
yarn build-keycloak-theme
```

Les fichiers JAR sont générés dans `dist_keycloak/` :
- `keycloak-theme-for-kc-26.2-and-above.jar` (Keycloak 26.2+)
- `keycloak-theme-for-kc-25.jar` (Keycloak 25)
- etc.

### 2. Déploiement

**Sur le serveur Keycloak :**
```bash
# Copier le JAR dans le dossier providers
cp keycloak-theme-for-kc-26.2-and-above.jar /opt/keycloak/providers/

# Rebuild Keycloak
/opt/keycloak/bin/kc.sh build

# Redémarrer Keycloak
systemctl restart keycloak
```

**Avec Docker/Podman :**
```bash
# Copier dans le container
podman cp keycloak-theme-for-kc-26.2-and-above.jar keycloak-container:/opt/keycloak/providers/

# Redémarrer le container
podman restart keycloak-container
```

### 3. Activation dans Keycloak

1. Connectez-vous à l'admin Keycloak : `https://keycloak-recette.hubee.gouv.fr/admin`
2. Sélectionnez votre realm
3. **Realm Settings** → **Themes**
4. Sélectionnez `keycloakify-theme-dsfr` pour :
   - **Login theme**
   - **Email theme**
5. Cliquez sur **Save**

## 🌐 Gestion des traductions

### Via l'interface admin (recommandé)

1. **Realm Settings** → **Localization**
2. Sélectionnez l'onglet **Français**
3. Cliquez sur **Add key**
4. Ajoutez ou modifiez les clés de traduction

**Exemple - Modifier le texte d'expiration du lien :**
- **Key** : `passwordResetBodyHtml`
- **Value** :
```html
<p>Quelqu'un vient de demander une réinitialisation de mot de passe pour votre compte {2}. Si vous êtes à l'origine de cette requête, veuillez cliquer sur le lien ci-dessous pour le mettre à jour.</p><p><a href="{0}">Lien pour réinitialiser votre mot de passe</a></p><p>Ce lien expirera dans {3}.</p><p>Sinon, veuillez ignorer ce message ; aucun changement ne sera effectué sur votre compte.</p>
```

⚠️ **Important** : Gardez les variables `{0}`, `{2}`, `{3}` telles quelles.

### Via fichiers (non recommandé)

Si vous souhaitez gérer les traductions via fichiers :

1. Créez `src/email/messages/messages_fr.properties`
2. Ajoutez vos traductions personnalisées
3. Marquez le fichier comme owned : `npx keycloakify own --path "email/messages/messages_fr.properties"`
4. Rebuild et redéployez le thème

**Désavantage** : Nécessite un rebuild complet à chaque modification.

## 📧 Configuration SMTP

Pour les emails en recette :

1. **Realm Settings** → **Email**
2. Configurez :
   - **Host** : smtp.hubee.gouv.fr
   - **Port** : 587 (ou 25)
   - **From** : noreply@hubee.gouv.fr
   - **Enable StartTLS** : Oui
   - **Enable Authentication** : Si nécessaire
3. Testez avec **Save and test**

## 🎨 Thème Email DSFR

Le thème email respecte le Système de Design de l'État Français :
- Couleurs officielles (#000091 pour les liens)
- Police Marianne
- Design responsive
- Template minimaliste

Les contenus des emails utilisent les templates par défaut de Keycloak et peuvent être personnalisés via l'interface admin.
