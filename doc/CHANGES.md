# Portfolio Update — November 2026

- **Removed the MBA (Zimbabwe Open University)** from Education — not yet enrolled.
- MTech renamed to **Data Science & Analytics**; BSc now shows the Upper Second (2.1) class.
- New **AI Research** section (`#research`, `src/sass/sections/_research.scss`): ASR for
  low-resource languages; LLMs, AI agents & conversational interfaces; AI-enabled crop
  management; smart water management.
- Experience rewritten from the updated CV (Tuto Consulting, HIT Centre for AI, Tetisol,
  Lionturf, MSU). Tetisol entry no longer names a client — the CV marks client details
  confidential.
- Hero gets a research/dev subtitle; About rewritten; Skills split into Core / AI & ML /
  Software Development; meta tags updated.

# Portfolio & CV Update — August 2026

This documents the changes made to the portfolio site and CV to reflect Isaiah's current
roles, education, and projects.

## Summary

- Repositioned the site from "Computer Systems Engineering Graduate" to **AI Researcher &
  AI Systems Developer**.
- Added Experience, Education, Skills, and References sections (previously the site only had
  Hero / About / Projects / Contact).
- Pulled in real projects from GitHub (`github.com/kuzivakwashe0225`) to the Projects section.
- Rebuilt `src/assets/resume.pdf` as a real PDF matching the finalized CV content, in the same
  blue CVpop-style design (banner, photo, colour scheme) as the original.
- Added `deploy/` with Dockerfile/Nginx/deploy-script/guide for moving hosting to a Contabo
  VPS (files only — no live server was touched).

## Portfolio changes (`src/index.html`, `src/styles.scss`, `src/data/scrollRevealConfig.js`)

**Hero**
- Subtitle changed from "Computer Systems Engineering Graduate" to "AI Researcher & AI
  Systems Developer".

**About**
- Summary rewritten to describe an active participant in AI systems development, research,
  continuous learning, and strategic management (matches the CV summary).

**Experience** *(new section, `#experience`)* — reverse-chronological:
1. Junior Software Developer — Tetisol Private Limited (Remote) — 1 Jun 2026–Present
2. AI Research Assistant — Harare Institute of Technology — 12 Jan 2026–Present
3. IT Intern Technician — Midlands State University — Mar 2024–Aug 2024
4. Software Quality Officer & Junior Software Developer — Tuto Consulting (Remote) —
   1 Sep 2023–Present
5. Intern IT Administrator → Part-Time IT Administrator & Software Developer — Lionturf
   Instrumentation Pvt Ltd — Jan 2022–Apr 2024

**Education** *(new section, `#education`)*:
- MTech, Big Data & Machine Learning — Harare Institute of Technology — Aug 2026–Present
- MBA — Zimbabwe Open University — Aug 2026–Present
- BSc Honours Computer Systems Engineering — Midlands State University — 2021–2025
- Ordinary & Advanced Level (Zimsec) — Prince Edward School — 2018–2020
- POTRAZ Researcher Symposium in ICT (research writing training) — Jul 2026

**Skills** *(new section, `#skills`)*:
- Core: AI Research, React JS, Node JS, Python
- Secondary tags kept for portfolio context (HTML/CSS/MongoDB/AWS/Django/Java/Figma) and a
  management/communication group — these are additive to the CV, not a contradiction of it.

**Projects**
- Fixed the Chord Catcher link to point at the real repo (`chord_catcher`) instead of the
  generic profile link.
- Removed the fabricated "Delivery App (In Development)" placeholder (no matching repo
  existed).
- Added a real project card for **IntraHub** (`internship-management-system`).
- Added a "More on GitHub" grid with **LandSolutions**, **Network Checker & Critical Result
  Dispatcher**, **HIT Gate Management System**, and **The Saloon App** (marked in-development),
  plus a "View all repositories on GitHub" link.
- `isaiah_Portfolio` (this repo) and `The-Saloon-App`'s near-empty state were handled
  honestly — no fabricated screenshots or feature claims.

**References** *(new section, `#references`)*:
- Framed around AI research / AI systems development / AI ethics.
- Phone numbers intentionally omitted from the public site (per Isaiah's decision) — shows
  name, role, organization, with a "Request full contact details" mailto link instead.
- List: Dr Magadza (Director, Center for AI, HIT), Mr Rebanewako (MSU), Mr Mazengere (Tuto
  Consulting), Mr Kashanu (MSU).

**Footer / meta**
- Copyright line and page `<title>`/`<meta description>`/`<meta keywords>` updated to the AI
  Researcher & AI Systems Developer framing.

## CV changes (`src/assets/resume.pdf`)

The old `resume.pdf` (and a stray unused duplicate at `src/resume.pdf`) were replaced with a
newly generated PDF built from an HTML source (rendered via headless Chrome print-to-PDF) that
reproduces the original CVpop blue banner/photo design. Content now matches Isaiah's finalized
CV exactly:

- Subtitle changed to AI Researcher & AI Systems Developer.
- Summary, experience order/dates/bullets, and education dates updated to match.
- Driver's licence trimmed to just "Class 2 Drivers Licence" (previously listed C1, C plus a
  separate "Special license" line).
- Attachments section (QR-coded certificate links) removed entirely.
- Job-related skills simplified to AI Research / React JS / Node JS / Python only.
- References section added: Dr Magadza, Mr Rebanewako, Mr Mazengere, Mr Kashanu (Mr
  Chidzvondo removed per the finalized CV).
- ZJC entry dropped (finalized CV only lists O&A Level).

## Hosting (`deploy/`)

Added but **not yet run against any live server**:
- `Dockerfile` / `nginx.conf` / `docker-compose.yml` — containerized option.
- `deploy.sh` — builds the site and `rsync`s `dist/` to a server over SSH.
- `DEPLOYMENT.md` — step-by-step guide for both a plain Nginx+rsync setup and a Docker setup
  on a Contabo VPS, including Let's Encrypt/HTTPS via certbot.

To actually move hosting to Contabo, share the server's IP/domain and SSH access — nothing
here touches Vercel, so the existing deployment keeps working until DNS is repointed.

## Known follow-ups (not fixed here — outside what this session had access to)

1. The GitHub repo's **Website** field (Settings → General) still points to an old link,
   `isaiah-portfolio-tawny.vercel.app`, instead of `isaiah-portfolio-sigma.vercel.app`. No API
   write access was available to fix this automatically.
2. `internship-management-system/backend/.env` appears to be committed to the public GitHub
   repo. Worth checking it doesn't contain real secrets, rotating anything sensitive, and
   adding `.env` to that repo's `.gitignore`.
