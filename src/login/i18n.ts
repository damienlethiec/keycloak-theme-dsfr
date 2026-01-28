import { i18nBuilder } from "keycloakify/login";
import type { ThemeName } from "../kc.gen";

/** @see: https://docs.keycloakify.dev/i18n */
// eslint-disable-next-line @typescript-eslint/no-unused-vars
const { useI18n, ofTypeI18n } = i18nBuilder
    .withThemeName<ThemeName>()
    .withCustomTranslations({
        en: {
            "or-login-with-email": "Or sign in with your email",
            loginTotpStep3:
                "Enter the application name followed by your name in the \"Device Name\" field, then enter the one-time code provided by the application and click \"Submit\" to complete the setup.",
            loginTotpGuideLink: "Two-factor authentication (2FA) setup guide for mobile or desktop app",
            loginOtpInstruction:
                "Open your authentication app (mobile or desktop) configured for HubEE, then enter the 6-digit one-time code."
        },
        fr: {
            "or-login-with-email": "Ou connectez-vous avec votre email",
            accountTemporarilyDisabledMessage:
                "Ce compte est temporairement verrouillé, contactez votre administrateur ou bien réessayez plus tard.",
            loginTotpStep3:
                "Renseignez le nom de l'application utilisée suivi de votre nom dans le champ « Nom de l'appareil », entrez le code à usage unique fourni par l'application et cliquez sur le bouton « Soumettre » pour finaliser la configuration.",
            loginTotpGuideLink: "Guide de configuration de la double authentification (2FA) par application mobile ou bureau",
            loginOtpInstruction:
                "Ouvrez votre application d'authentification (mobile ou bureau) configurée pour HubEE, puis saisissez le code à usage unique à 6 chiffres."
        }
    })
    .build();

type I18n = typeof ofTypeI18n;

export { useI18n, type I18n };
