# Description:
#   Script to check if the module being imported is exported
#
# Example:
#   ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
#   ├───────────────────────────────────────────────────────────────────────────────────────────┤
#   │ $ find <target-directory-path> -type f -name <target-file-name> \                         │
#   │   | xargs -I {} sh -c 'awk -f <script-path> {}'                                           │
#   │ $ find ./src -type f -name "index.ts" \                                                   │
#   │   | xargs -I {} sh -c 'awk -f ./main.awk {}' \                                            │
#   │   | xargs -I {} open {} -a "Visual Studio Code"                                           │
#   ╰───────────────────────────────────────────────────────────────────────────────────────────╯

# Exit if module is included
function is_module_exported(module_name) {
  for (exported_module in exported_modules) {
    if (module_name == exported_module) {
      print FILENAME;
      exit;
    }
  }
}

/^import( type)? \* as .+ from "\.\/.+"/ {
  # If only the type is read, the format is aligned to simplify processing
  sub(" type", "", $0);

  imported_module = $4;
  exported_modules[imported_module] = "";
}

/^export \{ .+ \};/ {
  sub("export { ", "", $0);
  sub("};", "", $0);
  split($0, exported_names, ", ");
  for (i in exported_names) {
    is_module_exported(exported_names[i]);
  }
}

/^export {$/,/^}/ {
  if ($0 ~ /^export {$/) {
    next;
  }
  if ($0 ~ /^}/) {
    next;
  }
  module_name = $1;
  sub(",", "", module_name);
  is_module_exported(module_name);
}
