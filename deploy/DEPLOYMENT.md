# Deploying to your Contabo server

The site is a static Parcel build (plain HTML/CSS/JS, no server-side code), so it just needs a
web server pointing at the built `dist/` folder. Two options are provided — pick one.

## Option A — Plain Nginx + rsync (simplest, recommended)

**On the Contabo server (one-time setup):**

```bash
sudo apt update && sudo apt install -y nginx certbot python3-certbot-nginx
sudo mkdir -p /var/www/portfolio
sudo chown $USER:$USER /var/www/portfolio
```

Point your domain's DNS A record at the server's IP address before continuing.

Create `/etc/nginx/sites-available/portfolio` using [nginx.conf](nginx.conf) as a base, but set
`root /var/www/portfolio;` and `server_name yourdomain.com;`. Then enable it:

```bash
sudo ln -s /etc/nginx/sites-available/portfolio /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
sudo certbot --nginx -d yourdomain.com   # issues + auto-configures HTTPS
```

**From your machine, every time you want to publish an update:**

```bash
SERVER_USER=<ssh-user> SERVER_HOST=<server-ip-or-domain> SERVER_PATH=/var/www/portfolio ./deploy/deploy.sh
```

This runs `npm run build` locally and `rsync`s the `dist/` output to the server. Requires SSH
key access to the server (`ssh-copy-id <ssh-user>@<server-ip>` first if you haven't already).

## Option B — Docker

Useful if you're already running other sites/containers on the same Contabo box behind a host
Nginx reverse proxy.

```bash
# on the server, after cloning/pulling the repo
docker compose -f deploy/docker-compose.yml up -d --build
```

This builds the site and serves it on `127.0.0.1:8080` inside the server (not exposed
externally). Point your host Nginx at it as a reverse proxy, e.g.:

```nginx
server {
    listen 80;
    server_name yourdomain.com;
    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host $host;
    }
}
```

Then run `sudo certbot --nginx -d yourdomain.com` as in Option A to add HTTPS.

To publish an update: `git pull && docker compose -f deploy/docker-compose.yml up -d --build`.

## Moving off Vercel

Once the Contabo domain is live and verified, update:
- Any links pointing at `isaiah-portfolio-sigma.vercel.app` (CV, GitHub repo "Website" field,
  LinkedIn, etc.) to the new domain.
- The GitHub repo's homepage field currently points to an old link
  (`isaiah-portfolio-tawny.vercel.app`) — update it under repo **Settings → General → Website**
  regardless of which host you land on.

## What I still need from you to actually run this

I didn't touch any live server — these files are ready to use whenever you share:
1. The server's IP address or domain, and an SSH user with access.
2. Which option you'd prefer (A or B).

Once I have SSH access I can run the one-time setup and first deploy for you.
