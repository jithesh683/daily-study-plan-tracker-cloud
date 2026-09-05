# Daily Task Tracker — GitHub Pages + Supabase

This version keeps the existing tracker UI but stores tasks in Supabase so the same task/status data can be used from multiple computers and browsers.

## Setup

1. Create a Supabase project.
2. Open **SQL Editor** and run `supabase-setup.sql`.
3. In Supabase, open **Connect** / API Keys and copy the **Project URL** and **Publishable key**. Supabase documents the browser `createClient()` pattern and recommends a publishable key for browser code; never expose a secret/service-role key. See the official docs: https://supabase.com/docs/reference/javascript/initializing and https://supabase.com/docs/guides/getting-started/api-keys
4. Open `index.html` and replace:
   - `PASTE_YOUR_SUPABASE_PROJECT_URL_HERE`
   - `PASTE_YOUR_SUPABASE_PUBLISHABLE_KEY_HERE`
5. Commit the updated `index.html` to the GitHub repository.
6. GitHub Pages will rebuild the site.

## Important security note

The included SQL intentionally allows anonymous read/write access so this simple tracker works without login. Anyone who has the website URL could potentially modify the data. For confidential company/NPD data, use Supabase Auth + Row Level Security policies tied to authenticated users/team membership before production use.
