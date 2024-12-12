# 1.1 create a post-checkout hook
cat <<EOL > .git/hooks/post-checkout
#!/bin/sh

if [ -x "which pip" ]; then
  pip install pre-commit
elif [ -x "/opt/homebrew/bin" ]; then
  brew install pre-commit
fi
pre-commit install
pre-commit install --hook-type commit-msg
EOL
chmod +x .git/hooks/post-checkout

# 1.2 create a post-merge hook (trigger after git pull)
cat <<EOL > .git/hooks/post-merge
#!/bin/sh

if [ -x "which pip" ]; then
  pip install pre-commit
elif [ -x "/opt/homebrew/bin" ]; then
  brew install pre-commit
fi
pre-commit install
pre-commit install --hook-type commit-msg
EOL
chmod +x .git/hooks/post-merge

# 2. run the script once
.git/hooks/post-checkout