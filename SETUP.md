# Labas Lietuva v0.2 — setup (iPhone + free email sync)

## A. Publish for free (no terminal required)
1. On a computer, create a free account at https://github.com and verify your email.
2. Create a new **public** repository, for example `labas-lietuva`. Do **not** upload passwords or private credentials.
3. Upload the **contents** of the `labas-lietuva` folder (`index.html`, `sw.js`, `icon.svg`, `manifest.webmanifest`, `config.js`, etc.) to the repository root, and commit.
4. In repository **Settings → Pages**, choose **Deploy from a branch**, branch `main`, folder `/ (root)`, then save. Wait for the HTTPS Pages URL, typically `https://YOUR-USERNAME.github.io/labas-lietuva/`.
5. On iPhone, open that exact URL in **Safari**. Use Share → **Add to Home Screen** → Add. Launch from the new icon.
6. The sample lessons and local progress work without Supabase. Internet is needed for the first load and some voice features. Hosting UI and availability may change.

## B. Enable email login + sync (optional, free tier subject to limits)
1. Create a free project at https://supabase.com/dashboard. Keep your database password private.
2. Open **SQL Editor**, paste and run `database.sql` once. This creates a progress table with per-user Row Level Security.
3. In **Authentication → Providers → Email**, enable email sign-in; choose whether to require email confirmation. For confirmation, add the deployed HTTPS URL to Authentication URL configuration and redirect allowlist as appropriate.
4. In **Project Settings → API**, copy **Project URL** and **publishable/anon public key** (not the `service_role` or secret key). Put them in `config.js`:
   `window.LABAS_CONFIG = {supabaseUrl: "https://YOURPROJECT.supabase.co", supabaseAnonKey: "YOUR_PUBLIC_KEY"};`
5. Commit the updated `config.js` to GitHub and reload the app. Open **Profile**, register with email and password, confirm email if required, then sign in.
6. Cloud sync uses a simple single-record last-write approach with some merging of completed lessons and XP; it is **not** a conflict-proof multi-device sync engine. Avoid editing on two devices simultaneously. Export progress periodically.

## C. Limitations / safety
- The app is a learning prototype with **eight** sample lessons (A1: five, A2/B1/B2: one each), not a completed A1–B2 curriculum.
- It does not yet grade microphone pronunciation or include verified native-speaker recordings. Speech synthesis depends on available Lithuanian voices on your iPhone.
- The CDN library for Supabase auth needs network access; the learning shell is cached for offline use.
- The progress JSON is personal learning data. A public repository is suitable for source code, but never upload exported user progress or passwords.
- If you change the app's URL/domain, update the authentication redirect settings.
