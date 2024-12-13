# 1. Define script to run as: init, post-checkout, post-merge
read -r -d '' PRE_COMMIT_HOOK << EOL
#!/bin/sh

if [ -x "which pip" ]; then
  pip install pre-commit
elif [ -x "/opt/homebrew/bin" ]; then
  brew install pre-commit
fi
pre-commit install
pre-commit install --hook-type commit-msg
EOL

# 2. Set script to post-checkout & post-merge
#    This will pre-commit changes will be applied on git pull
echo "$PRE_COMMIT_HOOK" > .git/hooks/post-checkout
chmod +x .git/hooks/post-checkout
echo "$PRE_COMMIT_HOOK" > .git/hooks/post-merge
chmod +x .git/hooks/post-merge

# 3. Trigger initial script run
bash <<< "$PRE_COMMIT_HOOK"