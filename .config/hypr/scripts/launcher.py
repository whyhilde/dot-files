import os
import subprocess
import sys
import configparser


import fzf


DESKTOP_DIRS = [
    "/usr/share/applications/",
    os.path.expanduser("~/.local/share/applications/"),
]


def get_apps():
    apps = {}
    for folder in DESKTOP_DIRS:
        if not os.path.exists(folder):
            continue

        for file in os.listdir(folder):
            if file.endswith(".desktop"):
                path = os.path.join(folder, file)
                config = configparser.ConfigParser(interpolation=None)

                try:
                    config.read(path, encoding="utf-8")
                    if "Desktop Entry" in config:
                        entry = config["Desktop Entry"]

                        if entry.get("NoDisplay") != "true" and entry.get("Hidden") != "true" and entry.get("Terminal") != "true" and entry.get("Type") == "Application":
                            name = entry.get("Name", file)
                            exec = entry.get("Exec", "").split("%")[0].strip()
                            if name and exec:
                                apps[name] = exec

                except Exception:
                    continue

    return apps


def main():
    apps = get_apps()

    if not apps:
        print("Programs not found.")
        sys.exit(1)

    selected = fzf.run(sorted(apps.keys()), [])

    if selected in apps:
        cmd = apps[selected]

        subprocess.Popen(cmd.split(), stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, preexec_fn=os.setpgrp)
        sys.exit(0)


if __name__ == "__main__":
    main()
