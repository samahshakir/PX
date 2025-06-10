#!/bin/bash

# ================
# RANDOM COMMIT GENERATOR (6 MONTHS)
# ================

# Full list of commit messages
messages=(
  "minor cleanup"
  "fix typo in comment"
  "remove unused variable"
  "refactor small function"
  "update .gitignore"
  "cleanup formatting"
  "remove dead code"
  "adjust spacing and lint warnings"
  "quick patch"
  "add initial API integration"
  "implement partial login flow"
  "add basic error handler"
  "start work on dashboard layout"
  "added simple caching layer"
  "add search filter logic"
  "implement draft notifications system"
  "basic settings page"
  "add experimental feature toggle"
  "prototype UI component"
  "fix crash on startup"
  "patch intermittent null reference issue"
  "fix API response handling bug"
  "resolve timeout issue"
  "fix broken mobile layout"
  "fix date parsing bug"
  "resolve CORS issue"
  "fix pagination issue"
  "correct failed state transition"
  "update deployment config"
  "tweak CI pipeline settings"
  "update environment variables"
  "add stage env config"
  "cleanup Dockerfile"
  "fix build step for production"
  "update npm packages"
  "upgrade dependencies"
  "add missing scripts"
  "update README"
  "add usage instructions"
  "improve internal docs"
  "add simple code example"
  "document new API endpoint"
  "update changelog"
  "test experimental algorithm"
  "try new layout idea"
  "wip: trying a new approach"
  "temporary commit for debugging"
  "add logs for analysis"
  "experimenting with auth flow"
  "initial rough version"
  "quick revision"
  "rearrange folder structure"
  "wip cleanup"
  "optimize response time a bit"
  "small tweak to UX"
  "remove console logs"
  "hotfix after deployment"
  "patch wrong config value"
  "fix minor UI glitch"
)

# Start 6 months ago → now
start_date=$(date -d "6 months ago" +%s)
end_date=$(date +%s)

echo "Generating random commit history..."

current=$start_date

while [ $current -lt $end_date ]
do
  # Random skip days (makes history natural)
  if (( RANDOM % 3 == 0 )); then
    current=$(( current + 86400 ))
    continue
  fi

  # Create 0–3 commits that day
  commits_today=$(( RANDOM % 4 ))

  for ((i=0; i<commits_today; i++))
  do
    msg="${messages[$RANDOM % ${#messages[@]}]}"
    commit_date=$(date -d "@$current" "+%Y-%m-%dT%H:%M:%S")

    echo "$msg" >> history_log.txt

    GIT_AUTHOR_DATE="$commit_date" GIT_COMMITTER_DATE="$commit_date" git add .
    GIT_AUTHOR_DATE="$commit_date" GIT_COMMITTER_DATE="$commit_date" git commit -m "$msg"
  done

  current=$(( current + 86400 ))
done

echo "Done! Use: git push --force"
