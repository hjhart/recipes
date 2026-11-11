---
name: import-instagram-reminder
description: Find an Instagram recipe in the user's Apple Reminders, import it with the instagram-recipe-extractor into the recipes site, then mark the reminder complete
---

# Import Instagram Recipe from Reminders

Use when the user says to look at their reminders for an Instagram recipe and add it to the recipe site.

## Steps

1. **Find the reminder.** Load the apple-reminders tools via ToolSearch (`apple-reminders reminders_tasks`), then call `reminders_tasks` with `action: read`, `search: "instagram"` (incomplete only). Reminders are typically titled "<Creator> on Instagram" with a truncated caption in the notes. If there are several, ask which one.

2. **Get the URL.** The reminders tool does NOT return the URL field, and AppleScript against Reminders.app times out. Don't waste time on those. Instead:
   - Ask the user for the link, or check where they said they put it (Obsidian daily note under `Daily/YYYY-MM-DD.md` or the "What to do with Free Time" note). Obsidian may not have synced; if the note on disk (`/Users/jameshart/workspace/Life's Musings`) lacks it, ask the user to paste the link.
   - Normalize `/reels/<id>/` to `/reel/<id>/`.

3. **Run the extractor.**
   ```
   cd ~/workspace/instagram-recipe-extractor && bin/extract "https://www.instagram.com/reel/<id>/"
   ```
   It downloads the video, extracts frames, and writes a draft `.cook` to `~/workspace/recipes/recipes/<slug>.cook` (the MAIN checkout, not a worktree). If yt-dlp fails with an auth error, the user must re-export Instagram cookies from Firefox into `cookies.txt`.

4. **Use the full caption, not the draft.** The draft is GPT-4o output and may drop details (e.g. "1 heaping cup", split cheeses, notes). Read the full caption at `~/workspace/instagram-recipe-extractor/videos/<timestamp>/video.description` and rewrite the recipe faithfully, following CLAUDE.md conventions: YAML frontmatter, `date added: <today>`, prose paragraph steps, inline `@ingredient{qty%unit}`, `#cookware{}`, `~{time%unit}`, exact wording kept. Use `source:` = the reel URL and `author:` = the creator. Omit `servings` if the caption doesn't give it. Use decimals or the `1 heaping` text form carefully; check `cook recipe <file>` parses without warnings (cook time must be a single value like "1 hour 5 minutes", not a range).
   - Follow the user's weight preference only if they ask "by weight" (baking ingredients in grams, butter always tbsp).

5. **Image.** Frames are in `~/workspace/instagram-recipe-extractor/videos/<timestamp>/images/frameNNNN.jpg`. View a few late frames (scale down with ffmpeg first) and pick the one that shows the whole finished dish. Save at `recipes/<slug>.jpg` (e.g. `ffmpeg -i frameNNNN.jpg -vf scale=1080:-1`). No `image` frontmatter field.

6. **Clean up the draft.** Delete the extractor's draft `.cook` from `~/workspace/recipes/recipes/` so the main checkout isn't left with an untracked duplicate.

7. **Commit and push to main** (user's rule: no feature branches):
   ```
   git add recipes/<slug>.cook recipes/<slug>.jpg && git commit -m "Add <title> recipe" && git push origin HEAD:main
   ```

8. **Mark the reminder complete:** `reminders_tasks` with `action: update`, `id: <reminder id>`, `completed: true`.

9. Show the user the finished recipe and confirm what was committed.
