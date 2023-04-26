const() {
    eval "alias $1=\$3"
}

lorem_ipsum='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
 incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
 voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
 proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

const c            = 'code .'
const o            = 'open .'
const p            = 'pbcopy'

const todayd       = 'mkdir $(date "+%Y-%m-%d")'
const todayf       = 'touch $(date "+%Y-%m-%d").md'
const readme       = 'touch README.md'
const makefile     = 'touch Makefile'
const vs           = 'mkdir .vscode && touch .vscode/settings.json'
const workflow     = 'touch .github/workflows/main.yml'

const stop-all     = 'docker stop $(docker ps -q)'
const rm-all       = 'docker rm $(docker ps -a -q)'
const rmi-all      = 'docker rmi $(docker images -q)'

const pangram      = 'echo "The quick brown fox jumps over the lazy dog" | pbcopy'
const lorem-ipsum  = "echo '$lorem_ipsum' | pbcopy"

const 1m           = 'countdown 60 3'
const 2m           = 'countdown 120 3'
const 3m           = 'countdown 180 3'
const 5m           = 'countdown 300 3'
const 10m          = 'countdown 600 3'

const 8080         = 'open http://localhost:8080'
const 3000         = 'open http://localhost:3000'
const 5173         = 'open http://localhost:5173'

jdiff() {
    diff <(jq --sort-keys . $1) <(jq --sort-keys . $2)
}

ppng() {
    osascript -e 'set the clipboard to (read (POSIX file "'$1'") as JPEG picture)'
}

snake() {
    python3 -c 'import sys; print("_".join(sys.argv[1].lower().split(" ")), end="")' $1 | pbcopy
}

camel() {
    python3 -c 'import sys; print("".join(sys.argv[1].title().split(" ")), end="")' $1 | pbcopy
}

countdown() {
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
            afplay /System/Library/Sounds/Funk.aiff
        done
    fi
}

stopwatch() {
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
