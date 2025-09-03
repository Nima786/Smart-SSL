# Smart-SSL

_The intelligent Let's Encrypt & Cloudflare companion for seamless SSL certificate management._

> ℹ️ **Smart-SSL** is a powerful Bash script that supercharges `certbot` by integrating it with Cloudflare's DNS API. This allows you to issue and manage Let's Encrypt SSL certificates—including **wildcards**—without needing open ports (80/443) on your server. It's a complete, menu-driven solution for effortless, secure, and flexible certificate management.

- - -

## ✨ Key Features

*   ✅ **Cloudflare DNS-01 Challenge:** Obtain SSL certificates without exposing your server to the internet on port 80. Perfect for internal services, firewalled servers, or non-standard setups.
*   ✅ **Wildcard Certificate Support:** Easily secure all your subdomains (`*.example.com`) with a single certificate.
*   ✅ **Standard Certbot Methods:** Full support for traditional `standalone` and `webroot` challenges if you prefer them.
*   ✅ **Automated Publishing:** Automatically copies renewed certificates to a location of your choice, ensuring your applications always have the latest cert.
*   ✅ **Full Lifecycle Management:** A user-friendly menu to add, list, remove, and manage your domains.
*   ✅ **Effortless Migration:** Import existing `certbot` certificates into Smart-SSL management or convert them from standard methods to the more powerful Cloudflare DNS method.
*   ✅ **Self-Contained & Smart:** Includes dependency installation, self-update, and a clean uninstaller.
*   ✅ **Secure by Design:** Manages your Cloudflare API token securely with appropriate file permissions.

- - -

## 🚀 Why Smart-SSL?

While `certbot` is an amazing tool, managing certificates can become complex, especially in scenarios without a standard web server or when wildcard support is needed. Smart-SSL bridges this gap.

> ✅ **The biggest advantage:** The Cloudflare DNS method. Smart-SSL automates the process of adding a temporary DNS TXT record to prove domain ownership. This means:
> 
> *   **No Downtime:** No need to stop your web server to issue a cert.
> *   **No Open Ports Required:** Your server can remain completely firewalled from public web traffic on port 80.
> *   **Ultimate Flexibility:** Get certificates for any machine, not just your public-facing web servers.

- - -

## 🛠️ Installation & Setup

### 1\. Download the Script

```
curl -sSL https://raw.githubusercontent.com/Nima786/Smart-SSL/main/smart-ssl -o /usr/local/bin/smart-ssl
chmod +x /usr/local/bin/smart-ssl
```

### 2\. Run the Interactive Menu

Just run the script as root to launch the main menu:

```
sudo smart-ssl
```

### 3\. Initial Setup

From the main menu, complete these two one-time steps:

1.  Select **Option 1) Install dependencies** to ensure `certbot` and the Cloudflare plugin are installed.
2.  Select **Option 2) Setup** to configure your Let's Encrypt email and your Cloudflare API Token.

> ⚠️ **Cloudflare API Token:** You can generate a token from your Cloudflare Dashboard. Go to **My Profile → API Tokens → Create Token**. Use the "Edit zone DNS" template for the required permissions.

- - -

## 📖 Common Workflows

### Issuing a Certificate (Cloudflare Method)

This is the recommended method for most use cases.

1.  Choose **Option 3) Add certificate (Cloudflare DNS)**.
2.  Enter your domain (e.g., `example.com`).
3.  Choose the mode: `simple` for the base domain or `wildcard` to secure all subdomains.
4.  (Optional) Specify a **Publish Path**. This is where Smart-SSL will copy the certificate files (`privkey.pem` and `fullchain.pem`) for your applications to use.

### Managing Your Certificates

*   **List Domains (Option 5):** View all managed domains, their mode, publish path, and expiry date.
*   **Change Publish Path (Option 6):** Update the destination directory for a certificate and immediately publish the latest version.
*   **Remove a Domain (Option 9):** Stop managing a domain with Smart-SSL, with an option to also delete the certificate from `certbot`.

- - -

## 🔮 Advanced Features

### Importing an Existing Certificate (Option 10)

Already have certificates on your server? You can bring them under Smart-SSL management to enable features like auto-publishing.

1.  Select **Option 10) Import existing Certbot certificate**.
2.  Choose the certificate you wish to adopt from the list.
3.  Define a publish path if needed.

### Converting to Cloudflare DNS (Option 11)

Upgrade an existing certificate (e.g., one issued via the `webroot` method) to the more robust Cloudflare DNS method.

1.  Select **Option 11) Convert existing Certbot cert to Cloudflare DNS**.
2.  Choose the certificate to convert. The script will automatically re-issue it using the Cloudflare API.

- - -

## ⚙️ Maintenance

*   **Self-Update (Option 12):** Fetches the latest version of the script directly from GitHub.
*   **Uninstall (Option 13):** A comprehensive uninstaller that cleanly removes the script and its configurations.
*   **Manual Renew (Option 7):** Perform a dry run of the renewal process for your managed domains to test your setup.

- - -

## 🤖 Non-Interactive CLI

Every menu option is also available as a command-line argument, making Smart-SSL perfect for automation. Run `smart-ssl help` to see all available commands.

```
# Example: List domains from the command line
smart-ssl list

# Example: Publish a certificate for a specific domain
smart-ssl publish mydomain.com
```
