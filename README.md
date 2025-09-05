<h1>Smart-SSL</h1>

<p><em><strong>The intelligent Let's Encrypt & Cloudflare companion for seamless SSL certificate management.</strong></em></p>

<blockquote>
  <h3>🚀 Quick Setup</h3>
  <p>For a one-line installation and execution, run the following command:</p>
  <pre><code>bash <(curl -fsSL https://raw.githubusercontent.com/Nima786/Smart-SSL/main/quick-install.sh)</code></pre>
</blockquote>

<blockquote>
  <p>ℹ️ <strong>Smart-SSL</strong> is a powerful Bash script that supercharges <code>certbot</code> by integrating it with Cloudflare's DNS API. This allows you to issue and manage Let's Encrypt SSL certificates—including <strong>wildcards</strong>—without needing open ports (80/443) on your server. It's a complete, menu-driven solution for effortless, secure, and flexible certificate management.</p>
</blockquote>

<hr>

<h2>✨ Key Features</h2>

<ul>
  <li>✅ <strong>Cloudflare DNS-01 Challenge:</strong> Obtain SSL certificates without exposing your server to the internet on port 80. Perfect for internal services, firewalled servers, or non-standard setups.</li>
  <li>✅ <strong>Wildcard Certificate Support:</strong> Easily secure all your subdomains (<code>*.example.com</code>) with a single certificate.</li>
  <li>✅ <strong>Standard Certbot Methods:</strong> Full support for traditional <code>standalone</code> and <code>webroot</code> challenges if you prefer them.</li>
  <li>✅ <strong>Automated Publishing:</strong> Automatically copies renewed certificates to a location of your choice, ensuring your applications always have the latest cert.</li>
  <li>✅ <strong>Full Lifecycle Management:</strong> A user-friendly menu to add, list, remove, and manage your domains.</li>
  <li>✅ <strong>Effortless Migration:</strong> Import existing <code>certbot</code> certificates into Smart-SSL management or convert them from standard methods to the more powerful Cloudflare DNS method.</li>
  <li>✅ <strong>Self-Contained & Smart:</strong> Includes dependency installation, self-update, and a clean uninstaller.</li>
  <li>✅ <strong>Secure by Design:</strong> Manages your Cloudflare API token securely with appropriate file permissions.</li>
</ul>

<hr>

<h2>🚀 Why Smart-SSL?</h2>

<p>While <code>certbot</code> is an amazing tool, managing certificates can become complex, especially in scenarios without a standard web server or when wildcard support is needed. Smart-SSL bridges this gap.</p>

<blockquote>
  <p>✅ <strong>The biggest advantage:</strong> The Cloudflare DNS method. Smart-SSL automates the process of adding a temporary DNS TXT record to prove domain ownership. This means:</p>
  <ul>
    <li><strong>No Downtime:</strong> No need to stop your web server to issue a cert.</li>
    <li><strong>No Open Ports Required:</strong> Your server can remain completely firewalled from public web traffic on port 80.</li>
    <li><strong>Ultimate Flexibility:</strong> Get certificates for any machine, not just your public-facing web servers.</li>
  </ul>
</blockquote>

<hr>

<h2>🛠️ Installation & Setup</h2>

<h3>1. Download the Script</h3>
<pre><code>curl -sSL https://raw.githubusercontent.com/Nima786/Smart-SSL/main/smart-ssl -o /usr/local/bin/smart-ssl
chmod +x /usr/local/bin/smart-ssl</code></pre>

<h3>2. Run the Interactive Menu</h3>
<p>Just run the script as root to launch the main menu:</p>
<pre><code>sudo smart-ssl</code></pre>

<h3>3. Initial Setup</h3>
<p>From the main menu, complete these two one-time steps:</p>
<ol>
  <li>Select <strong>Option 1) Install dependencies</strong> to ensure <code>certbot</code> and the Cloudflare plugin are installed.</li>
  <li>Select <strong>Option 2) Setup</strong> to configure your Let's Encrypt email and your Cloudflare API Token.</li>
</ol>

<blockquote>
  <p>⚠️ <strong>Cloudflare API Token:</strong> You can generate a token from your Cloudflare Dashboard. Go to <strong>My Profile → API Tokens → Create Token</strong>. Use the "Edit zone DNS" template for the required permissions.</p>
</blockquote>

<hr>

<h2>📖 Common Workflows</h2>

<h3>Issuing a Certificate (Cloudflare Method)</h3>
<p>This is the recommended method for most use cases.</p>
<ol>
  <li>Choose <strong>Option 3) Add certificate (Cloudflare DNS)</strong>.</li>
  <li>Enter your domain (e.g., <code>example.com</code>).</li>
  <li>Choose the mode: <code>simple</code> for the base domain or <code>wildcard</code> to secure all subdomains.</li>
  <li>(Optional) Specify a <strong>Publish Path</strong>. This is where Smart-SSL will copy the certificate files (<code>privkey.pem</code> and <code>fullchain.pem</code>) for your applications to use.</li>
</ol>

<h3>Managing Your Certificates</h3>
<ul>
  <li><strong>List Domains (Option 5):</strong> View all managed domains, their mode, publish path, and expiry date.</li>
  <li><strong>Change Publish Path (Option 6):</strong> Update the destination directory for a certificate and immediately publish the latest version.</li>
  <li><strong>Remove a Domain (Option 9):</strong> Stop managing a domain with Smart-SSL, with an option to also delete the certificate from <code>certbot</code>.</li>
</ul>

<hr>

<h2>🔮 Advanced Features</h2>

<h3>Importing an Existing Certificate (Option 10)</h3>
<p>Already have certificates on your server? You can bring them under Smart-SSL management to enable features like auto-publishing.</p>
<ol>
  <li>Select <strong>Option 10) Import existing Certbot certificate</strong>.</li>
  <li>Choose the certificate you wish to adopt from the list.</li>
  <li>Define a publish path if needed.</li>
</ol>

<h3>Converting to Cloudflare DNS (Option 11)</h3>
<p>Upgrade an existing certificate (e.g., one issued via the <code>webroot</code> method) to the more robust Cloudflare DNS method.</p>
<ol>
  <li>Select <strong>Option 11) Convert existing Certbot cert to Cloudflare DNS</strong>.</li>
  <li>Choose the certificate to convert. The script will automatically re-issue it using the Cloudflare API.</li>
</ol>

<hr>

<h2>⚙️ Maintenance</h2>

<ul>
  <li><strong>Self-Update (Option 12):</strong> Fetches the latest version of the script directly from GitHub.</li>
  <li><strong>Uninstall (Option 13):</strong> A comprehensive uninstaller that cleanly removes the script and its configurations.</li>
  <li><strong>Manual Renew (Option 7):</strong> Perform a dry run of the renewal process for your managed domains to test your setup.</li>
</ul>

<hr>

<h2>🤖 Non-Interactive CLI</h2>

<p>Every menu option is also available as a command-line argument, making Smart-SSL perfect for automation. Run <code>smart-ssl help</code> to see all available commands.</p>

<pre><code># Example: List domains from the command line
smart-ssl list

# Example: Publish a certificate for a specific domain
smart-ssl publish mydomain.com</code></pre>
