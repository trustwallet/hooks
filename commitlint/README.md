# 🎉 Trust Wallet Commitlint

![PyPI Version](https://img.shields.io/pypi/v/hooks)
![License](https://img.shields.io/github/license/trustwallet/hooks)
![Last Commit](https://img.shields.io/github/last-commit/trustwallet/hooks)
![Issues](https://img.shields.io/github/issues/trustwallet/hooks)
![Stars](https://img.shields.io/github/stars/trustwallet/hooks?style=social)
![Forks](https://img.shields.io/github/forks/trustwallet/hooks?style=social)
![Downloads](https://img.shields.io/pypi/dm/hooks)
![Contributors](https://img.shields.io/github/contributors/trustwallet/hooks)
![Result Image](https://raw.githubusercontent.com/trustwallet/hooks/master/images/demo.png)

`commitlint` is a powerful and easy-to-use Python pre-commit hook that helps enforce [Conventional Commits](https://www.conventionalcommits.org/) rules on your commit messages. It supports adding relevant emojis based on your commit types to enhance readability and bring some fun to your commit history! 🚀

## 📜 What are Conventional Commits?

Conventional Commits provide a lightweight convention for creating a clear and explicit commit history. By using this hook, you'll ensure that your commit messages follow this convention, making your versioning easier to manage and your collaboration more seamless.

## 💡 Features

- ✅ Enforces Conventional Commits rules on your commit messages.
- 🎨 Optionally adds context-specific emojis to the start of commit messages.
- 🛑 Blocks commits that do not conform to the Conventional Commits standard.
- 🔧 Allows for **custom commit types** and **custom emojis** via configuration.
- 🔄 **Auto-Merge Commit Handling**: Automatically formats auto-merge commit messages to follow a consistent style.

## 🔄 Auto-Merge Commit Handling

The `commitlint` tool includes functionality to handle auto-merge commit messages. When a commit message matches the pattern "Merge branch '...' into '...'", it is automatically reformatted to a more consistent style, such as "merge: branch '...' into '...'". If emojis are enabled, a 🎉 emoji is prepended to the message. This feature ensures that even auto-generated commit messages maintain a clean and readable format.

## 🔧 Customization

You can customize the commit types and their associated emojis by modifying the `commit_types.py` and `commits_check_config.yaml` files. These files allow you to define additional commit types and specify emojis for each type.

### Example : [`commit_types.py`](https://github.com/trustwallet/hooks/blob/master/commitlint/commitlint/commit_types.py)

```python
commit_types = {
    "access": {
        "description": "Improve accessibility.",
        "emoji": "♿️"
    },
    "analytics": {
        "description": "Add or update analytics or track code.",
        "emoji": "📈"
    },
    "animation": {
        "description": "Add or update animations and transitions.",
        "emoji": "💫"
    },
    "arch": {
        "description": "Make architectural changes.",
        "emoji": "🏗️"
    },
    "assets": {
        "description": "Add or update assets.",
        "emoji": "🍱"
    },
    "beer": {
        "description": "Write code drunkenly.",
        "emoji": "🍻"
    },
    # ... more commit types ...
}
```

### Customizing Existing Emojis

You can also modify the emojis for existing commit types by updating the `commits_check_config.yaml`:

```yaml
additional_commit_types:
  feat:
    description: Introduce new features.
    emoji: 🎉
  fix:
    description: Fix a bug.
    emoji: 🛠️
```

## ⚙️ Installation

To add `commitlint` to your project, follow these steps:

1. **Update your `.pre-commit-config.yaml`:**

   In your project’s root directory, add the following:

   ```yaml
   repos:
     - repo: https://github.com/trustwallet/hooks/commitlint
       rev: HEAD  # Use the latest release version
       hooks:
         - id: commitlint
           stages: [commit-msg]
           args: ["--emoji-disabled"]  # Use this argument to disable emojis
   ```

2. **Install the pre-commit hook:**

   ```bash
   pre-commit install --hook-type commit-msg -f
   ```

3. **Install the `commitlint` package:**

   ```bash
   pip install -U commitlint
   ```

4. **Optional:** Update the pre-commit package:

   ```bash
   pre-commit autoupdate
   ```

## 🚀 Usage

Once the hook is added, it will automatically run each time you make a commit. The hook checks your commit message against Conventional Commits rules, optionally adds the appropriate emoji, and prevents non-conforming commits.

## 👨‍💻 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to enhance `commitlint`. Let’s make commits fun and consistent! 😄

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

Enhance your workflow and bring some life to your commits with `commitlint`! 🎉✨🐛