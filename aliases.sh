const() {
    eval "alias $1=\$3"
}

lorem_ipsum='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
 incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
 voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
 proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

const c           = 'code .'
const o           = 'open .'
const p           = 'pbcopy'

const cdd         = 'cd ~/Desktop'
const cdtoday     = 'cd $(date "+%Y-%m-%d")'

const todayd      = 'mkdir $(date "+%Y-%m-%d")'
const vsc         = 'mkdir .vscode && touch .vscode/settings.json'

const readme      = 'touch README.md'
const makefile    = 'touch Makefile'
const workflow    = 'touch .github/workflows/main.yml'

const stop-all    = 'docker stop $(docker ps -q)'
const rm-all      = 'docker rm $(docker ps -a -q)'
const rmi-all     = 'docker rmi $(docker images -q)'

const pangram     = 'echo "The quick brown fox jumps over the lazy dog" | pbcopy'
const lorem-ipsum = "echo '$lorem_ipsum' | pbcopy"

const 1m          = 'countdown 60 3'
const 2m          = 'countdown 120 3'
const 3m          = 'countdown 180 3'
const 5m          = 'countdown 300 3'
const 10m         = 'countdown 600 3'

const 8080        = 'open http://localhost:8080'
const 3000        = 'open http://localhost:3000'
const 5173        = 'open http://localhost:5173'

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
