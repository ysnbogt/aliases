# Description:
#   Script to display a specific section of a previous PR associated with a file
#
# Example:
#   ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
#   ├───────────────────────────────────────────────────────────────────────────────────────────┤
#   │ $ tmp <file-path> [remote-name]                                                           │
#   │ $ tmp ./src/index.js                                                                      │
#   │   https://github.com/owner/repository/pull/2                                              │
#   │                                                                                           │
#   │   - [x] Check item 1                                                                      │
#   │   - [x] Check item 2                                                                      │
#   │                                                                                           │
#   │ $ tmp ./src/index.js upstream                                                             │
#   │   ...                                                                                     │
#   ╰───────────────────────────────────────────────────────────────────────────────────────────╯
#
#   ╭─ Markdown ─ https://github.com/owner/repository/pull/2 ───────────────────────────────────╮
#   ├───────────────────────────────────────────────────────────────────────────────────────────┤
#   │ ## Summary                                                                                │
#   │                                                                                           │
#   │ Feature description                                                                       │
#   │                                                                                           │
#   │ ## Why this pull request                                                                  │
#   │                                                                                           │
#   │ - https://github.com/owner/repository/issue/2                                             │
#   │                                                                                           │
#   │ ## Operation check method                                                                 │
#   │                                                                                           │
#   │ - [x] Check item 1                                                                        │
#   │ - [x] Check item 2                                                                        │
#   │                                                                                           │
#   │ ## Related pull requests                                                                  │
#   │                                                                                           │
#   │ - https://github.com/owner/repository/pull/1                                              │
#   │ ...                                                                                       │
#   ╰───────────────────────────────────────────────────────────────────────────────────────────╯

header=2
title="Operation check method"

file_path=$1
remote_name=${2:-origin}

repository=$(basename `pwd`)
owner=$(
  git remote -v \
  | grep "^$remote_name" \
  | grep '(fetch)' \
  | sed -r 's/.*:([^\/]+)\/.*/\1/'
)
default_branch=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')

previous_commit_hashes=($(git blame $default_branch $file_path | awk '{ print $1 }' | sort | uniq))

pr_numbers=()
for commit_hash in "${previous_commit_hashes[@]}"; do
  pr_number=$(
    git log --merges --oneline --reverse --ancestry-path $commit_hash...$default_branch \
    | grep 'Merge pull request #' \
    | head -n 1 \
    | cut -f5 -d' ' \
    | sed -e 's%#%%'
  )
  if [[ ! " ${pr_numbers[@]} " =~ " $pr_number " ]]; then
    pr_numbers+=("$pr_number")
  fi
done

extract_section='
BEGIN {
  prefix = "";
  for (i = 0; i < header; i++) {
    prefix = prefix "#";
  }
  printing = 0;
}

{
  if ($0 ~ "^" prefix " " title) {
    printing = 1;
  } else if (printing == 1 && $0 ~ "^#{1,6} ") {
    exit;
  } else if (printing) {
    print $0;
  }
}
'

for pr_number in "${pr_numbers[@]}"; do
  pr_url="https://github.com/$owner/$repository/pull/$pr_number"
  accept="Accept: application/vnd.github.v3+json"
  endpoint="https://api.github.com/repos/$owner/$repository/pulls/$pr_number"
  authorization="Authorization: token $GITHUB_TOKEN"

  body=$(curl -s -H $authorization -H $accept "$endpoint" | jq -r ".body")
  text=$(echo "$body" | awk -v header="$header" -v title="$title" $extract_section)

  echo -e "\e[4m\e[34m$pr_url\e[0m"
  echo $text
  echo

  sleep 3
done
