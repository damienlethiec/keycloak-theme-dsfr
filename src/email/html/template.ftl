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

        h1, h2, h3 {
            font-weight: 700;
            margin: 0 0 16px 0;
        }

        h1 {
            font-size: 28px;
            line-height: 1.25;
        }

        h2 {
            font-size: 22px;
            line-height: 1.3;
        }

        p {
            margin: 0 0 16px 0;
        }

        a {
            color: #000091;
            text-decoration: underline;
        }

        /* DSFR Button */
        .fr-btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #000091;
            color: #FFFFFF !important;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            text-align: center;
        }

        .fr-btn:hover {
            background-color: #1212FF;
        }

        /* Alert boxes */
        .fr-alert {
            padding: 16px;
            border-radius: 4px;
            margin: 24px 0;
        }

        .fr-alert--info {
            background-color: #E3E3FD;
            border-left: 4px solid #000091;
        }

        .fr-alert--success {
            background-color: #B8FEC9;
            border-left: 4px solid #18753C;
        }

        .fr-alert--warning {
            background-color: #FFE9E6;
            border-left: 4px solid #B34000;
        }

        /* Responsive */
        @media only screen and (max-width: 600px) {
            .email-container {
                width: 100% !important;
                padding: 20px !important;
            }

            h1 {
                font-size: 24px !important;
            }

            h2 {
                font-size: 20px !important;
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

                    <!-- Contenu principal -->
                    <tr>
                        <td style="padding: 40px;">
                            <#nested>
                        </td>
                    </tr>

                    <!-- Footer -->
                    <tr>
                        <td style="padding: 24px 40px; background-color: #F6F6F6; border-top: 1px solid #E5E5E5; border-radius: 0 0 8px 8px;">
                            <p style="margin: 0; color: #666666; font-size: 14px; text-align: center; line-height: 1.5;">
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
