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

## ⚙️ Configuration des variables d'environnement

Le thème utilise des variables d'environnement pour personnaliser les emails et les pages de login.

### Variables pour les emails

```bash
# Configuration des événements email pour éviter les doublons (Keycloak 26+)
# Exclure les événements legacy qui seront supprimés dans Keycloak 27
KC_SPI_EVENTS_LISTENER_EMAIL_EXCLUDE_EVENTS="UPDATE_PASSWORD,UPDATE_TOTP,REMOVE_TOTP"
```

### Variables pour les pages de login

```bash
# Nom complet du service (affiché dans les emails via {2})
DSFR_THEME_SERVICE_TITLE="HubEE - Hub d'Échange de l'État"
# Marque affichée en haut des pages (supporte HTML)
DSFR_THEME_BRAND_TOP="République<br/>Française"

# URL de retour vers l'application, à adapter selon environnement
HUBEE_DOMAIN="basrec.hubee.numerique.gouv.fr"

# Configuration d'une notice sur les pages de login (optionnel)
DSFR_NOTICE_TITLE="Action requise : Réinitialisation de votre mot de passe"
DSFR_NOTICE_DESCRIPTION="<p>Pour continuer d'accéder à HubEE, vous devez réinitialiser votre mot de passe...</p>"
DSFR_NOTICE_SEVERITY="info"  # info, warning, error
```

### Activation des événements email

Pour recevoir les emails de notification (changement de mot de passe, etc.) :

1. **Realm Settings** → **Events** → **Config**
2. Dans **Event Listeners**, ajoutez `email`
3. Dans **Event Types**, sélectionnez :
   - `UPDATE_CREDENTIAL` (remplace UPDATE_PASSWORD à partir de KC 27)
   - `REMOVE_CREDENTIAL`
   - `LOGIN_ERROR`
   - `USER_DISABLED_BY_TEMPORARY_LOCKOUT`
4. Cliquez sur **Save**

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
