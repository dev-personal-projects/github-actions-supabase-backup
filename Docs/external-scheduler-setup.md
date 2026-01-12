# External Scheduler Setup

If GitHub Actions' scheduled workflows aren't reliable, you can trigger the backup workflow externally using the GitHub API.

## Quick Setup with cron-job.org

1. **Create a GitHub Personal Access Token**:
   - GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
   - Generate token with `repo` and `workflow` scopes

2. **Set up cron-job.org**:
   - Go to [cron-job.org](https://cron-job.org) (free)
   - Create new cron job:
     - **URL**: `https://api.github.com/repos/{OWNER}/{REPO}/actions/workflows/backup.yaml/dispatches`
       - Replace `{OWNER}` with your GitHub username/org
       - Replace `{REPO}` with your repo name (e.g., `db-backup-actions`)
     - **Method**: POST
     - **Headers**: 
       ```
       Authorization: token YOUR_GITHUB_TOKEN
       Accept: application/vnd.github.v3+json
       Content-Type: application/json
       ```
     - **Body**: 
       ```json
       {"ref":"main"}
       ```
     - **Schedule**: Set your desired time (e.g., `16 8 * * *` for daily at 08:16 UTC)

3. **Test**: Click "Test" in cron-job.org, then check GitHub Actions to verify it ran

## Direct API Call

You can also trigger it directly with curl:

```bash
curl -X POST \
  -H "Authorization: token YOUR_GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Content-Type: application/json" \
  -d '{"ref":"main"}' \
  https://api.github.com/repos/{OWNER}/{REPO}/actions/workflows/backup.yaml/dispatches
```

That's it! The existing `backup.yaml` workflow already supports `workflow_dispatch`, so no additional workflow files are needed.
