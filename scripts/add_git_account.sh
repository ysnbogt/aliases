#!/bin/bash

# Description:
# This script generates an SSH key, adds it to the SSH agent, and sets up SSH configuration for remote servers like GitHub.
# Prerequisites:
# - 'expect' must be installed on your system to run this script.
# - Handle passwords with care. Storing or entering passwords in plain text is a security risk.
# Example:
# ╭─ zsh ──────────────────────────────────────────────────────────────────────────────────────────╮
# ├────────────────────────────────────────────────────────────────────────────────────────────────┤
# │ $ source add_git_account.sh                                                                    │
# │ Account Name: user                                                                             │
# │ Password: spawn ssh-keygen -t rsa -f user                                                      │
# │ Generating public/private rsa key pair.                                                        │
# │ Enter passphrase (empty for no passphrase):                                                    │
# │ Enter same passphrase again:                                                                   │
# │ Your identification has been saved in user                                                     │
# │ Your public key has been saved in user.pub                                                     │
# │ The key fingerprint is:                                                                        │
# │ SHA256:******************************************* user@user.local                             │
# │ The key's randomart image is:                                                                  │
# │ +---[RSA 3072]----+                                                                            │
# │ |                 |                                                                            │
# │ |                 |                                                                            │
# │ |                 |                                                                            │
# │ |                 |                                                                            │
# │ |                 |                                                                            │
# │ |                 |                                                                            │
# │ |                 |                                                                            │
# │ |                 |                                                                            │
# │ |                 |                                                                            │
# │ +----[SHA256]-----+                                                                            │
# │ \spawn ssh-add user                                                                            │
# │ Identity added: user (user@user.local)                                                         │
# │ SSH key setup is complete. Next steps:                                                         │
# │                                                                                                │
# │ 1. Navigate to [SSH and GPG keys](https://github.com/settings/keys) in your GitHub settings.   │
# │                                                                                                │
# │ Do you want to open the GitHub SSH and GPG keys page in your browser?                          │
# │ Enter your choice [Y/n]: Y                                                                     │
# │                                                                                                │
# │ 2. Click on **New SSH Key**.                                                                   │
# │ 3. In the 'Title' field, enter a descriptive name for your new key.                            │
# │ 4. For 'Key', paste the SSH key you just copied. It's already in your clipboard.               │
# │ 5. Click on **Add SSH Key**.                                                                   │
# │ 6. Now, you can clone repositories using SSH. For example:                                     │
# │                                                                                                │
# │    git clone git@github.com:<username>/<repository>                                            │
# │                                                                                                │
# │ Replace <username> with your GitHub username and <repository> with the repository name.        │
# ╰────────────────────────────────────────────────────────────────────────────────────────────────╯

# Get username
user_name=$(whoami)

# Create .ssh directory if it doesn't exist
if [ ! -e ~/.ssh ]; then
  mkdir ~/.ssh
  chmod 700 ~/.ssh
fi

# Enter account name
echo -n "Account Name: "
read account_name

# Enter password
echo -n "Password: "
read -s password

# Generate ssh key
expect -c "
  spawn ssh-keygen -t rsa -f $account_name
  expect \"Enter passphrase (empty for no passphrase):\"
  send \"$password\r\"
  expect \"Enter same passphrase again:\"
  send \"$password\r\"
  interact
"

# Add ssh configuration
# NOTE: Change the host name as needed
template="
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/$account_name"
echo "$template" >> ~/.ssh/config

# Spin for 5 seconds
END=$((SECONDS+5))
while [ $SECONDS -lt $END ]; do
  for f in '|' '/' '-' '\'; do
    echo -ne "\r$f"
    sleep 0.1
  done
done

# Add ssh key
expect -c "
  spawn ssh-add $account_name
  expect \"Enter passphrase for $account_name:\"
  send \"$password\r\"
  interact
"

# Copy public key to clipboard
cat $account_name.pub | pbcopy

echo -e "\e[32mSSH key setup is complete. Next steps:\e[0m"
echo

echo -e "\e[34m1. Navigate to \e[4m\e[96m[SSH and GPG keys](https://github.com/settings/keys)\e[0m \e[34min your GitHub settings.\e[0m"
echo

# Ask to open GitHub SSH keys page
echo "Do you want to open the GitHub SSH and GPG keys page in your browser?"
echo -n "Enter your choice [Y/n]: "
read open_choice
if [[ -z "$open_choice" || "$open_choice" == [Yy]* ]]; then
    open https://github.com/settings/keys
else
    echo -e "\e[34mProceeding without opening the browser.\e[0m"
fi
echo

echo -e "\e[34m2. Click on \e[1m**New SSH Key**.\e[0m"
echo -e "\e[34m3. In the 'Title' field, enter a descriptive name for your new key.\e[0m"
echo -e "\e[34m4. For 'Key', paste the SSH key you just copied. It's already in your clipboard.\e[0m"
echo -e "\e[34m5. Click on \e[1m**Add SSH Key**.\e[0m"
echo -e "\e[34m6. Now, you can clone repositories using SSH. For example:\e[0m"
echo
echo -e "\e[93m   git clone git@github.com:<username>/<repository>\e[0m"
echo
echo -e "\e[34mReplace \e[93m<username>\e[34m with your GitHub username and \e[93m<repository>\e[34m with the repository name.\e[0m"
