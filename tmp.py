import json
import re
import shlex
from subprocess import run

from pynput.keyboard import GlobalHotKeys, Key


def convert_shortcut_to_key(shortcut_pattern: str) -> str:
    return re.sub(
        r"<(.*?)>", lambda match: str(Key[match.group(1)].value), shortcut_pattern
    )


shortcut_actions = {}
with open("./shortcuts.json", "r", encoding="utf-8") as shortcuts_file:
    for shortcut_key, command_string in json.load(shortcuts_file).items():
        shortcut_actions[convert_shortcut_to_key(shortcut_key)] = lambda: run(
            shlex.split(command_string)
        )

with GlobalHotKeys(shortcut_actions) as hotkey_listener:
    hotkey_listener.join()
