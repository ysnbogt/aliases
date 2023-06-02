<h1 align="center">Aliases</h1>

| Name          | Explanation or Command                                                                  |
| ------------- | --------------------------------------------------------------------------------------- |
| `c`           | `'code .'`                                                                              |
| `o`           | `'open .'`                                                                              |
| `p`           | `'pbcopy'`                                                                              |
| `m`           | `'make'`                                                                                |
| `cdd`         | `'cd ~/Desktop'`                                                                        |
| `cdtoday`     | `'cd $(date "+%Y-%m-%d")'`                                                              |
| `todayd`      | `'mkdir $(date "+%Y-%m-%d")'`                                                           |
| `vsc`         | `'mkdir .vscode && touch .vscode/settings.json'`                                        |
| `workflows`   | `'mkdir -p .github/workflows && touch .github/workflows/main.yml'`                      |
| `readme`      | `'touch README.md'`                                                                     |
| `makefile`    | `'touch Makefile'`                                                                      |
| `stop-all`    | `'docker stop $(docker ps -q)'`                                                         |
| `rm-all`      | `'docker rm $(docker ps -a -q)'`                                                        |
| `rmi-all`     | `'docker rmi $(docker images -q)'`                                                      |
| `pangram`     | `'echo "The quick brown fox jumps over the lazy dog" \| pbcopy'`                        |
| `lorem-ipsum` | `"echo '$lorem_ipsum' \| pbcopy"`                                                       |
| `now`         | `'echo -e $(date "+%Y-%m-%d %H:%M:%S") \| pbcopy'`                                      |
| `vsc-black`   | `"cat $DIR/templates/vscode/black.json \| pbcopy"`                                      |
| `1m`          | `'countdown 60 3'`                                                                      |
| `2m`          | `'countdown 120 3'`                                                                     |
| `3m`          | `'countdown 180 3'`                                                                     |
| `5m`          | `'countdown 300 3'`                                                                     |
| `10m`         | `'countdown 600 3'`                                                                     |
| `8080`        | `'open http://localhost:8080'`                                                          |
| `3000`        | `'open http://localhost:3000'`                                                          |
| `5173`        | `'open http://localhost:5173'`                                                          |
| `jdiff()`     | Comparing Two JSON Files                                                                |
| `ppng()`      | Copying an image to the clipboard                                                       |
| `ccpng()`     | Make the code into an image and then copy it to the clipboard.                          |
| `snake()`     | Snake case a string and copy it to the clipboard                                        |
| `camel()`     | CamelCase a string and copy it to the clipboard                                         |
| `countdown()` | Countdown for specified time. <kbd>Ctrl</kbd> + <kbd>C</kbd> to stop.                   |
| `stopwatch()` | Stopwatch. <kbd>Ctrl</kbd> + <kbd>C</kbd> to stop.                                      |
| `todayf()`    | Create a file with today's date.                                                        |
| `cattoday()`  | Display the contents of the file with today's date.                                     |
| `color()`     | Display colors in the console. Text color is the opposite of the specified color        |
| `today()`     | Display today's date.                                                                   |
| `qrgen()`     | Generate a QR code and display it in the console.                                       |
| `f()`         | Format the code and display it in the console.                                          |
| `endpoint()`  | Script to create a markdown endpoint summary from a file directly under `src/pages/api` |
| `watt()`      | Watt conversion                                                                         |
| `findf()`     | Find file                                                                               |
| `findd()`     | Find directory                                                                          |
| `fsize()`     | File size                                                                               |
| `dsize()`     | Directory size                                                                          |
| `backup()`    | Backup file                                                                             |
| `clonecd()`   | Clone repository and cd into it                                                         |
