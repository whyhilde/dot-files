import subprocess
import sys
import os


import fzf


def main():
    options = {
        "lock screen": "hyprlock --no-fade-in",
        "shutdown": "systemctl poweroff",
        "reboot": "systemctl reboot",
    }

    selected = fzf.run(options.keys(), [])

    if selected in options:
        cmd = options[selected]
        subprocess.Popen(cmd.split(), stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, preexec_fn=os.setpgrp)

    sys.exit(0)


if __name__ == "__main__":
    main()
