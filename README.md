# Smart-SSL

Minimal, VPN-friendly SSL certificate helper using **certbot** + **Cloudflare DNS** (DNS-01).  
Built for V2Ray / Xray / sing-box / trojan panels — **no web server required**.

## One-command install
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Nima786/Smart-SSL/main/quick-install.sh)
```
This installs `smart-ssl` and opens the **Main Menu**.

## Usage
```bash
smart-ssl          # open menu
smart-ssl list     # list domains
smart-ssl dry-run  # test renewal
```

## Features
- Install dependencies (`certbot`, `python3-certbot-dns-cloudflare`, `openssl`)
- Setup (Let’s Encrypt email + Cloudflare API token)
- Issue **simple** or **wildcard** certs
- Optional publish paths & reload hooks
- Auto-renew with `certbot.timer`
