# Daily Study Plan / Task Tracker — GitHub Pages + Supabase

This is a static GitHub Pages website using Supabase as the shared cloud database.

## What this solves

The tracker does NOT store tasks only in the browser. Tasks are stored in Supabase, so the same task/status is available from different computers and browsers.

It also listens for Supabase realtime changes, so a change made on one computer can appear on another open tracker.

## Setup

### 1. Supabase

1. Open your Supabase project.
2. Go to **SQL Editor**.
3. Open `supabase-setup.sql`.
4. Run the complete SQL.
5. Click **Connect** in Supabase and choose the **Framework**/client option if needed.
6. Copy your Project URL and the public **publishable/anon key**.

### 2. Configure the website

Open `config.js` and replace:

- `PASTE_YOUR_SUPABASE_PROJECT_URL_HERE`
- `PASTE_YOUR_SUPABASE_PUBLISHABLE_OR_ANON_KEY_HERE`

Do NOT use a `service_role` or secret key in `config.js`.

### 3. Upload to GitHub

Put these files in the root of your repository:

- `index.html`
- `config.js`
- `supabase-setup.sql`
- `README.md`

Commit the changes.

### 4. Enable GitHub Pages

Repository → **Settings** → **Pages**

Under **Build and deployment**:

- Source: **Deploy from a branch**
- Branch: **main**
- Folder: **/ (root)**
- Click **Save**

After GitHub finishes deployment, open the Pages URL.

## Important security note

This version is intentionally configured for a shared public tracker. The public Supabase key is okay to place in a frontend, but the SQL policies allow anyone with access to the site to read/write/delete tracker rows.

For a private company tracker, add Supabase Authentication and change the RLS policies before using it with sensitive information.
