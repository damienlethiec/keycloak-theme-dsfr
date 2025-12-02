import type { PageProps } from "keycloakify/login/pages/PageProps";
import type { KcContext } from "../KcContext";
import type { I18n } from "../i18n";
import Alert from "@codegouvfr/react-dsfr/Alert";
import { fr } from "@codegouvfr/react-dsfr";

export default function Error(props: PageProps<Extract<KcContext, { pageId: "error.ftl" }>, I18n>) {
    const { kcContext, i18n, doUseDefaultCss, Template, classes } = props;

    const { statusCode, properties } = kcContext;

    const { msg } = i18n;

    // Detect 404 errors by checking the HTTP status code
    const is404Error = statusCode === 404;

    // Build environment-specific URLs based on HUBEE_DOMAIN property
    const hubeeDomain = properties.HUBEE_DOMAIN;
    const portailUrl = `https://portail.${hubeeDomain}/`;
    const authUrlPattern = `https://auth.${hubeeDomain}/`;

    // Show custom 404 message only for page not found errors
    if (is404Error) {
        return (
            <Template
                kcContext={kcContext}
                i18n={i18n}
                doUseDefaultCss={doUseDefaultCss}
                classes={classes}
                displayMessage={false}
                headerNode="Page non trouvée"
            >
                <Alert
                    severity="warning"
                    title="⚠️ Page non trouvée"
                    description="L'URL à laquelle vous tentez d'accéder n'est plus valide."
                    className={fr.cx("fr-mb-4w")}
                />

                <div className={fr.cx("fr-mb-4w")}>
                    <p className={fr.cx("fr-text--bold")}>
                        👉 Pour vous connecter sur le Portail HubEE, veuillez cliquer sur l'URL suivante :
                    </p>
                    <p>
                        <a className={fr.cx("fr-link")} href={portailUrl} target="_blank" rel="noopener noreferrer">
                            {portailUrl}
                        </a>
                    </p>
                </div>

                <Alert
                    severity="info"
                    title="💡 NB"
                    description={`Pensez à enregistrer cette adresse dans vos favoris, et à supprimer toute URL commençant par : « ${authUrlPattern} »`}
                    className={fr.cx("fr-mb-4w")}
                    small
                />

            </Template>
        );
    }

    // For other errors (500, etc.), show standard error message
    const { message } = kcContext;

    return (
        <Template
            kcContext={kcContext}
            i18n={i18n}
            doUseDefaultCss={doUseDefaultCss}
            classes={classes}
            displayMessage={false}
            headerNode={msg("errorTitle")}
        >
            {message !== undefined && (
                <Alert
                    severity={message.type}
                    description={message.summary}
                    className={fr.cx("fr-mb-4w")}
                    small
                />
            )}
        </Template>
    );
}
