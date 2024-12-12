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

echo "$PRE_COMMIT_HOOK" > .git/hooks/post-checkout
chmod +x .git/hooks/post-checkout
echo "$PRE_COMMIT_HOOK" > .git/hooks/post-merge
chmod +x .git/hooks/post-merge

bash <<< "$PRE_COMMIT_HOOK"