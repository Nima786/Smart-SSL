**English** | [فارسی](README.fa.md)

* * *

Smart-SSL
=========

_**The intelligent Let's Encrypt & Cloudflare companion for seamless SSL certificate management.**_

> ### 🚀 Quick Setup
> 
> For a one-line installation and execution, run the following command:
> 
>     bash <(curl -fsSL https://raw.githubusercontent.com/Nima786/Smart-SSL/main/quick-install.sh)

> ℹ️ **Smart-SSL** is a powerful Bash script that supercharges `certbot` by integrating it with Cloudflare's DNS API. This allows you to issue and manage Let's Encrypt SSL certificates—including **wildcards** and **multi-domain** certificates—without needing open ports (80/443) on your server. It's a complete, menu-driven solution for effortless, secure, and flexible certificate management.

* * *

✨ Key Features
--------------

*   ✅ **Cloudflare DNS-01 Challenge:** Obtain SSL certificates without exposing your server to the internet on port 80. Perfect for internal services, firewalled servers, or non-standard setups.
*   ✅ **Multi-Domain Certificates:** Issue separate certificates for multiple, completely different domains (e.g., `site1.com`, `api.site2.net`) in a single operation.
*   ✅ **Wildcard Certificate Support:** Easily secure all your subdomains (`*.example.com`) with a single certificate.
*   ✅ **Automated Publishing:** Automatically copies renewed certificates to a location of your choice, ensuring your applications always have the latest cert.
*   ✅ **"Smart" Management:** The interactive menus intelligently inspect your actual certificates, so you always see the full, correct list of domains covered.
*   ✅ **Full Lifecycle Management:** A user-friendly, numbered menu to add, list, remove, and manage your domains with safe defaults.
*   ✅ **Effortless Migration:** Import existing `certbot` certificates into Smart-SSL management or convert them to the more powerful Cloudflare DNS method.
*   ✅ **Self-Contained & Smart:** Includes dependency installation, self-update, and a clean uninstaller.
*   ✅ **Secure by Design:** Manages your Cloudflare API token securely with appropriate file permissions.

* * *

🚀 Why Smart-SSL?
-----------------

While `certbot` is an amazing tool, managing certificates can become complex, especially in scenarios without a standard web server or when wildcard support is needed. Smart-SSL bridges this gap.

> ✅ **The biggest advantage:** The Cloudflare DNS method. Smart-SSL automates the process of adding a temporary DNS TXT record to prove domain ownership. This means:
> 
> *   **No Downtime:** No need to stop your web server to issue a cert.
> *   **No Open Ports Required:** Your server can remain completely firewalled from public web traffic on port 80.
> *   **Ultimate Flexibility:** Get certificates for any machine, not just your public-facing web servers.

* * *

🛠️ Installation & Setup
------------------------

### 1\. Download the Script

    curl -sSL https://raw.githubusercontent.com/Nima786/Smart-SSL/main/smart-ssl -o /usr/local/bin/smart-ssl
    chmod +x /usr/local/bin/smart-ssl

### 2\. Run the Interactive Menu

Just run the script as root to launch the main menu:

    sudo smart-ssl

### 3\. Initial Setup

From the main menu, complete these two one-time steps:

1.  Select **Option 1) Install dependencies** to ensure `certbot` and the Cloudflare plugin are installed.
2.  Select **Option 2) Setup** to configure your Let's Encrypt email and your Cloudflare API Token.

### How to Get the Cloudflare API Token

For security, you should create an API token with the minimum required permissions. Follow these steps:

1.  Log in to your [Cloudflare Dashboard](https://dash.cloudflare.com).
2.  Click your profile icon in the top right and select **"My Profile"**.
3.  Navigate to the **"API Tokens"** tab on the left menu.
4.  Click the **"Create Token"** button.
5.  Scroll down to the "Custom token" section and click **"Get started"**. A better way is to find the **"Edit zone DNS"** template and click **"Use template"**.
6.  **Configure the token:**
    *   **Token name:** Give it a descriptive name (e.g., `smart-ssl-vps`).
    *   **Permissions:** The template will automatically add `Zone:DNS:Edit`, which is correct.
    *   **Zone Resources:** This is the most important step for security. Select **"Include"**, then **"Specific zone"**, and choose the domain you want to issue certificates for. Avoid using "All zones" unless absolutely necessary.
7.  Click **"Continue to summary"**.
8.  Review the settings and click **"Create Token"**.

> ⚠️ **Important:** Cloudflare will only show you the token **once**. Copy it immediately and save it in a safe place. You will not be able to see it again after you leave the page.

* * *

📖 Common Workflows
-------------------

### Issuing a Certificate (Cloudflare Method)

This is the recommended method for most use cases. From the main menu, choose **Option 3) Add certificate (Cloudflare DNS)**.

1.  **Choose the Certificate Type:**
    *   Select **1) Simple Certificate** for one or more specific domains.
    *   Select **2) Wildcard Certificate** for a single domain (e.g., `*.example.com`).
2.  **Enter Your Domain(s):**
    *   For a Simple cert, you can enter a single domain (`site1.com`) or a comma-separated list (`site1.com,site2.net`). The script will get a separate certificate for each.
    *   For a Wildcard cert, enter the single base domain (`example.com`).
3.  **(Optional) Specify a Publish Path:** This is where Smart-SSL will copy the certificate files (`privkey.pem` and `fullchain.pem`) for your applications to use.

### Managing Your Certificates

*   **List Domains (Option 5):** View all managed certificates, the full list of domains they cover, their custom paths, and expiry dates.
*   **Change Publish Path (Option 6):** Update the destination directory for a certificate and immediately publish the latest version.
*   **Remove a Domain (Option 9):** Safely remove a certificate from both Smart-SSL and `certbot`. The menu will show all domains covered by the certificate you are removing.

* * *

🔮 Advanced Features
--------------------

### Importing an Existing Certificate (Option 10)

Already have certificates on your server? You can bring them under Smart-SSL management to enable features like auto-publishing.

1.  Select **Option 10) Import existing Certbot certificate**.
2.  Choose the certificate you wish to adopt from the list.
3.  Define a publish path if needed.

### Converting to Cloudflare DNS (Option 11)

Upgrade an existing certificate (e.g., one issued via the `webroot` method) to the more robust Cloudflare DNS method.

1.  Select **Option 11) Convert existing Certbot cert to Cloudflare DNS**.
2.  Choose the certificate to convert. The script will automatically re-issue it using the Cloudflare API.

* * *

⚙️ Maintenance
--------------

*   **Self-Update (Option 12):** Fetches the latest version of the script directly from GitHub.
*   **Uninstall (Option 13):** A comprehensive uninstaller that cleanly removes the script and its configurations.
*   **Manual Renew (Option 7):** Perform a dry run of the renewal process for your managed domains to test your setup.

* * *

🤖 Non-Interactive CLI
----------------------

Every menu option is also available as a command-line argument, making Smart-SSL perfect for automation. Run `smart-ssl help` to see all available commands.

    # Example: List domains from the command line
    smart-ssl list
    
    # Example: Publish a certificate for a specific domain
    smart-ssl publish mydomain.com

* * *

❤️ Support the Project
----------------------

If you find Smart-SSL useful and want to support its development, you can buy me a coffee or send a donation.

*   **Crypto Wallet Address:** `zulavpn.x`

Thank you for your support!

* * *

License
-------

This project is licensed under the [MIT License](LICENSE).
