<#--
  Template email DSFR pour Keycloak - Version personnalisée HubEE
  Respecte les principes du Système de Design de l'État Français
  https://www.systeme-de-design.gouv.fr/

  This file has been claimed for ownership from @keycloakify/email-native version 260007.0.0.
-->

<#macro emailLayout>
<!DOCTYPE html>
<html lang="fr" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="x-apple-disable-message-reformatting" />
    <title>${msg("emailTitle")}</title>
    <style type="text/css">
        /* Marianne Font Loading */
        @font-face {
            font-family: 'Marianne';
            src: url('${url.resourcesUrl}/Marianne-Regular.woff2') format('woff2');
            font-weight: 400;
            font-style: normal;
            font-display: swap;
        }

        @font-face {
            font-family: 'Marianne';
            src: url('${url.resourcesUrl}/Marianne-Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
            font-display: swap;
        }

        /* Reset */
        body, table, td, a {
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
        }
        table, td {
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }
        img {
            -ms-interpolation-mode: bicubic;
            border: 0;
            height: auto;
            line-height: 100%;
            outline: none;
            text-decoration: none;
        }

        /* DSFR Typography */
        body {
            margin: 0;
            padding: 0;
            font-family: "Marianne", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
            font-size: 16px;
            line-height: 1.5;
            color: #161616;
            background-color: #F6F6F6;
        }

        /* DSFR Typography */
        h1 {
            font-size: 32px;
            font-weight: 700;
            line-height: 40px;
            margin: 0 0 24px 0;
        }

        h2 {
            font-size: 28px;
            font-weight: 700;
            line-height: 36px;
            margin: 0 0 24px 0;
        }

        h3 {
            font-size: 24px;
            font-weight: 700;
            line-height: 32px;
            margin: 0 0 24px 0;
        }

        p {
            font-size: 16px;
            line-height: 24px;
            margin: 0 0 24px 0;
        }

        a {
            color: #000091;
            text-decoration: underline;
        }

        /* DSFR Button - Conforme au min.css officiel */
        .fr-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 16px;
            min-height: 40px;
            background-color: #000091;
            color: #FFFFFF !important;
            text-decoration: none !important;
            font-size: 16px;
            font-weight: 500;
            line-height: 24px;
            border: none;
            border-radius: 0;
            -webkit-font-smoothing: antialiased;
        }

        .fr-btn:hover {
            background-color: #1212ff;
            text-decoration: none !important;
        }

        .fr-btn:active {
            background-color: #2323ff;
        }

        /* Responsive */
        @media only screen and (max-width: 600px) {
            .email-container {
                width: 100% !important;
                padding: 20px !important;
            }

            h1 {
                font-size: 28px !important;
                line-height: 36px !important;
            }

            h2 {
                font-size: 24px !important;
                line-height: 32px !important;
            }

            h3 {
                font-size: 22px !important;
                line-height: 28px !important;
            }
        }
    </style>
</head>
<body style="margin: 0; padding: 0; background-color: #F6F6F6;">
    <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color: #F6F6F6;">
        <tr>
            <td align="center" style="padding: 40px 20px;">
                <!-- Container principal -->
                <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="650" class="email-container" style="max-width: 650px; background-color: #FFFFFF; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

                    <!-- Header HubEE -->
                    <tr>
                        <td align="center" style="padding: 32px 40px 24px 40px; border-bottom: 1px solid #E5E5E5;">
                            <img src="${url.resourcesUrl}/logo-hubee.png" alt="HubEE - Hub d'Échange de l'État" style="max-width: 600px; height: auto;" />
                        </td>
                    </tr>

                    <!-- Contenu principal -->
                    <tr>
                        <td style="padding: 40px;">
                            <#nested>
                        </td>
                    </tr>

                    <!-- Footer -->
                    <tr>
                        <td style="padding: 24px 40px; background-color: #F6F6F6; border-top: 1px solid #E5E5E5; border-radius: 0 0 8px 8px;">
                            <p style="margin: 0; color: #666666; font-size: 14px; line-height: 1.5;">
                                Ce message vous a été envoyé automatiquement.<br/>
                                Merci de ne pas y répondre.
                            </p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
</#macro>
