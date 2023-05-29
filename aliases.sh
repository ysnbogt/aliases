const() {
    eval "alias $1=\$3"
}

DIR="$(dirname "$(readlink -f "$0")")"

lorem_ipsum='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
 incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
 voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
 proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ▏╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳│ Regular Aliases │╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳▕
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔

# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ░▒▓│ single letter     │▓▒░
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
const c           = 'code .'
const o           = 'open .'
const p           = 'pbcopy'

# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ░▒▓│ cd                │▓▒░
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
const cdd         = 'cd ~/Desktop'
const cdtoday     = 'cd $(date "+%Y-%m-%d")'

# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ░▒▓│ mkdir             │▓▒░
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
const todayd      = 'mkdir $(date "+%Y-%m-%d")'
const vsc         = 'mkdir .vscode && touch .vscode/settings.json'
const workflows   = 'mkdir -p .github/workflows && touch .github/workflows/main.yml'

# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ░▒▓│ touch             │▓▒░
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
const readme      = 'touch README.md'
const makefile    = 'touch Makefile'

# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ░▒▓│ docker            │▓▒░
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
const stop-all    = 'docker stop $(docker ps -q)'
const rm-all      = 'docker rm $(docker ps -a -q)'
const rmi-all     = 'docker rmi $(docker images -q)'

# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ░▒▓│ echo              │▓▒░
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
const pangram     = 'echo "The quick brown fox jumps over the lazy dog" | pbcopy'
const lorem-ipsum = "echo '$lorem_ipsum' | pbcopy"

# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ░▒▓│ cat               │▓▒░
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
const vsc-black   = "cat $DIR/templates/vscode/black.json | pbcopy"

# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ░▒▓│ countdown         │▓▒░
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
const 1m          = 'countdown 60 3'
const 2m          = 'countdown 120 3'
const 3m          = 'countdown 180 3'
const 5m          = 'countdown 300 3'
const 10m         = 'countdown 600 3'

# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ░▒▓│ open              │▓▒░
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
const 8080        = 'open http://localhost:8080'
const 3000        = 'open http://localhost:3000'
const 5173        = 'open http://localhost:5173'


# ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
# ▏╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳│ Function Aliases │╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳▕
# ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔

jdiff() {
    # Comparing Two JSON Files

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ jdiff <first-file> <second-file>                                                        │
    # │ $ jdiff a.json b.json                                                                     │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    diff <(jq --sort-keys . $1) <(jq --sort-keys . $2)
}

ppng() {
    # Copying an image to the clipboard

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ ppng <image-path>                                                                       │
    # │ $ ppng image.png                                                                          │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    osascript -e 'set the clipboard to (read (POSIX file "'$1'") as JPEG picture)'
}

ccpng() {
    # Make the code into an image and then copy it to the clipboard.

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ brew install silicon                                                                    │
    # │ $ ccpng main.py                                                                           │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    silicon $1 -o $1.tmp.png \
    && osascript -e 'set the clipboard to (read (POSIX file "'$1.tmp.png'") as JPEG picture)' \
    && rm $1.tmp.png
}

snake() {
    # Snake case a string and copy it to the clipboard

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ snake "Hello World"  # hello_world                                                      │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    python3 -c 'import sys; print("_".join(sys.argv[1].lower().split(" ")), end="")' $1 | pbcopy
}

camel() {
    # CamelCase a string and copy it to the clipboard

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ camel "Hello World"  # HelloWorld                                                       │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    python3 -c 'import sys; print("".join(sys.argv[1].title().split(" ")), end="")' $1 | pbcopy
}

countdown() {
    # Countdown for specified time. `Ctrl+C` to stop.

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ countdown <time> [number-of-sounds]                                                     │
    # │ $ countdown 60   # One minute later, no sound and exit.                                   │
    # │ $ countdown 5 1  # After 5 seconds, one sound and exit.                                   │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    countdown_seconds=$1
    start_time=$(date +%s)
    end_time=$((start_time + countdown_seconds))

    while true; do
        current_time=$(date +%s)
        remaining_time=$((end_time - current_time))
        if [ $remaining_time -lt 0 ]; then
            break
        fi
        seconds=$((remaining_time % 60))
        minutes=$((remaining_time / 60 % 60))
        hours=$((remaining_time / 3600))
        printf "\r%02d:%02d:%02d" $hours $minutes $seconds
        sleep 1
    done

    # Display a notification when the specified time has elapsed.
    # osascript -e 'display notification "Specified time has elapsed" with title "Terminal"'

    # Play as many notes as the number of the second argument.
    if [ $# -eq 2 ]; then
        for i in $(seq 1 $2); do
            # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────╮
            # ├───────────────────────────────────────────────────────────────────────────────────┤
            # │ $ ls /System/Library/Sounds                                                       │
            # │ Basso.aiff     Frog.aiff      Hero.aiff      Pop.aiff       Submarine.aiff        │
            # │ Blow.aiff      Funk.aiff      Morse.aiff     Purr.aiff      Tink.aiff             │
            # │ Bottle.aiff    Glass.aiff     Ping.aiff      Sosumi.aiff                          │
            # ╰───────────────────────────────────────────────────────────────────────────────────╯

            # Of course, original audio files can be specified.
            afplay /System/Library/Sounds/Funk.aiff
        done
    fi
}

stopwatch() {
    # Stopwatch. `Ctrl+C` to stop.

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ stopwatch                                                                               │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    start_time=$(date +%s)
    seconds=0
    minutes=0
    hours=0

    while true; do
        current_time=$(date +%s)
        elapsed_time=$((current_time - start_time))
        seconds=$((elapsed_time % 60))
        minutes=$((elapsed_time / 60 % 60))
        hours=$((elapsed_time / 3600))
        printf "\r%02d:%02d:%02d" $hours $minutes $seconds
        sleep 1
    done
}

todayf() {
    # Create a file with today's date.

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ todayf <file-extension>                                                                 │
    # │ $ todayf md                                                                               │
    # │ $ todayf py                                                                               │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    touch $(date "+%Y-%m-%d").$1
}

cattoday() {
    # Display the contents of the file with today's date.

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ cattoday <file-extension>                                                               │
    # │ $ cattoday md                                                                             │
    # │ $ cattoday py                                                                             │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    cat $(date "+%Y-%m-%d").$1
}

color() {
    # Display colors in the console. Text color is the opposite of the specified color

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ color <hex-code>                                                                        │
    # │ $ color 008000  # Green                                                                   │
    # │ $ color FF0000  # Red                                                                     │
    # │ $ color 0000FF  # Blue                                                                    │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    perl -e '
    foreach $a(@ARGV) {
        my($r, $g, $b) = unpack("C*", pack("H*", $a));
        my $inv_r = 255 - $r;
        my $inv_g = 255 - $g;
        my $inv_b = 255 - $b;
        printf "\e[48:2:%d:%d:%dm\e[38:2:%d:%d:%dm %s \e[0m", $r, $g, $b, $inv_r, $inv_g, $inv_b, $a;
    }
    print "\n";
    ' $1
}

today() {
    # Display today's date.

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ today [delimiter]                                                                       │
    # │ $ today      # 2023 05 01                                                                 │
    # │ $ today '-'  # 2023-05-01                                                                 │
    # │ $ today '/'  # 2023/05/01                                                                 │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯
    if [ $# -eq 1 ]; then
        delimiter=$1
    else
        delimiter=" "
    fi

    date "+%Y${delimiter}%m${delimiter}%d"
}

qrgen() {
    # Generate a QR code and display it in the console.

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ pip3 install qrcode                                                                     │
    # │ $ qrgen <text> [version] [level]                                                          │
    # │ $ qrgen https://github.com/ysnbogt 1 low                                                  │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯

    # Version: 1-40
    # Level  : low, medium, quartile, high

    python3 $DIR/scripts/qrgen.py $1 $2 $3
}

f() {
    # Format the code and display it in the console.

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ f <file-extension> <code>                                                               │
    # │ $ f ts 'console.log(1+2)'                                                                 │
    # │ ╭─ TypeScript ──────────────────────────────────────────────────────────────────────────╮ │
    # │ ├───────────────────────────────────────────────────────────────────────────────────────┤ │
    # │ │ console.log(1 + 2);                                                                   │ │
    # │ ╰───────────────────────────────────────────────────────────────────────────────────────╯ │
    # │ $ f py 'def hello(): print("Hello, world!")'                                              │
    # │ ╭─ Python ──────────────────────────────────────────────────────────────────────────────╮ │
    # │ ├───────────────────────────────────────────────────────────────────────────────────────┤ │
    # │ │ def hello():                                                                          │ │
    # │ │     print("Hello, world!")                                                            │ │
    # │ ╰───────────────────────────────────────────────────────────────────────────────────────╯ │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯

    if [ $# -ne 2 ]; then
        echo "Usage: f <file extension> <code>"
        return 1
    fi

    extension=$1
    code=$2

    tmpfile=$(mktemp tmp.$(uuidgen).${extension})

    echo "$code" > $tmpfile

    # TODO: Add any extensions and commands you like.
    case $extension in
        "ts")
            npx prettier --loglevel silent --write $tmpfile
            ;;
        "js")
            npx prettier --loglevel silent --write $tmpfile
            ;;
        "md")
            npx prettier --loglevel silent --write $tmpfile
            ;;
        "py")
            black -q $tmpfile
            ;;
        *)
            echo "Unsupported file extension: .$extension"
            rm $tmpfile
            return 1
            ;;
    esac

    cat $tmpfile
    rm $tmpfile
}

endpoint() {
    # Script to create a markdown endpoint summary from a file directly under `src/pages/api`

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ endpoint <path> [output-format] [code-type]                                             │
    # │ $ endpoint path/to/project                                                                │
    # │ $ endpoint path/to/project code curl                                                      │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯

    # Options
    #     ○ Output format            ○ Code type
    #        □ list(default)            □ httpie(default)
    #        □ code                     □ curl

    # ▽ src               ╭─ Zsh ─────────────────────────────────────────────────────────────────╮
    #   ▽ pages           ├───────────────────────────────────────────────────────────────────────┤
    #     ▽ api           │ $ endpoint path/to/project                                            │
    #     │ ▷ products    │ - [users](http://localhost:3000/api/users)                            │
    #     │ ▷ posts       │ - [users/:id](http://localhost:3000/api/users/:id)                    │
    #     │ ▽ users       │ - [search](http://localhost:3000/api/search)                          │
    #     │ │  [id].ts    │ ...                                                                   │
    #     │ │  index.ts   │ $ endpoint path/to/project > README.md                                │
    #     │  search.ts    ╰───────────────────────────────────────────────────────────────────────╯

    # ╭─ Markdown ─ README.md ────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ - [users](http://localhost:3000/api/users)                                                │
    # │ - [users/:id](http://localhost:3000/api/users/:id)                                        │
    # │ - [search](http://localhost:3000/api/search)                                              │
    # │ ...                                                                                       │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯

    convert_to_absolute_path() {
        local path="$1"
        if [[ ! "$path" = /* ]]; then
            path="$(pwd)/$path"
        fi
        echo "$path"
    }

    escape_slashes() {
        local path="$1"
        path="${path//\//\\/}"
        echo "$path"
    }

    absolute_path=$(convert_to_absolute_path "$1")
    escaped_path=$(escape_slashes "$absolute_path")

    EXTENSION='ts'
    EXTENSION_PATTERN="s/\.$EXTENSION//g"
    LIST_PATTERN='s/^(.+api\/)(.+)/- [`\2`](\1\2)/g'
    CODE_CURL_PATTERN='s/^(.+api\/)(.+)/\n**`\2`**\n\n```\ncurl \1\2\n```/g'
    CODE_HTTPIE_PATTERN='s/^(.+api\/)(.+)/\n**`\2`**\n\n```\nhttp \1\2\n```/g'

    files=$(find $absolute_path/src/pages/api -type f)

    for file in $files; do
        endpoints=$(echo $file \
        | sed -r 's/(.+)\[(.+)\].ts/\1:\2/' \
        | sed -r "s/$escaped_path\/src\/pages/http:\/\/localhost:3000/" \
        | sed -r 's/\/index//' \
        | sed -r $EXTENSION_PATTERN)

        if [ "$2" = "code" ]; then
            if [ "$3" = "curl" ]; then
                endpoints=$(echo "$endpoints" | sed -r "$CODE_CURL_PATTERN")
            else
                endpoints=$(echo "$endpoints" | sed -r "$CODE_HTTPIE_PATTERN")
            fi
        else
            endpoints=$(echo "$endpoints" | sed -r "$LIST_PATTERN")
        fi

        echo $endpoints
    done
}

watt() {
    # Watt conversion

    # ╭─ Zsh ─────────────────────────────────────────────────────────────────────────────────────╮
    # ├───────────────────────────────────────────────────────────────────────────────────────────┤
    # │ $ watt <from> XmYs <to>                                                                   │
    # │ $ watt 500 3m30s 600                                                                      │
    # ╰───────────────────────────────────────────────────────────────────────────────────────────╯

    if [ $# -ne 3 ]
    then
        echo "Usage: $0 <current watt> <duration> <new watt>"
        exit 1
    fi

    current_watt=$1
    duration=$2
    new_watt=$3

    if ! [[ "$current_watt" =~ ^[0-9]+$ ]] || ! [[ "$new_watt" =~ ^[0-9]+$ ]]
    then
        echo "Error: Wattage must be a number"
        exit 2
    fi

    if ! [[ "$duration" =~ ^[0-9]+m[0-9]+s$ ]]
    then
        echo "Error: Duration must be in the format XmYs (e.g., 3m30s)"
        exit 3
    fi

    minutes=$(echo $duration | cut -d 'm' -f 1)
    seconds=$(echo $duration | cut -d 's' -f 1 | cut -d 'm' -f 2)
    total_seconds=$((minutes*60 + seconds))

    power_seconds=$(echo "$current_watt * $total_seconds" | bc)

    new_seconds=$(echo "scale=2; $power_seconds / $new_watt" | bc)

    new_minutes=$(echo "scale=0; $new_seconds / 60" | bc)
    new_seconds=$(echo "scale=0; $new_seconds % 60" | bc)

    echo "${new_minutes}m${new_seconds}s"
}
