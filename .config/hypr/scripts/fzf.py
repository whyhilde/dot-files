import subprocess
import sys


OPTS = [
    "--style=minimal",
    "--info=hidden",
    "--reverse",
    "--cycle",
    "--prompt=> ",
    "--ghost=type & search",
    "--color=spinner:#d4be98,hl:#ea6962",
    "--color=fg:#fbf1c7,header:#ea6962,info:#d3869b,pointer:#7daea3",
    "--color=marker:#d3869b,fg+:#7daea3,prompt:#7daea3,hl+:#ea6962",
    "--color=selected-bg:#504945",
    "--color=border:#665c54,label:#7daea3",
]


def run(list, args):
    input_str = "\n".join(list)
    try:
        process = subprocess.Popen(
            ["fzf"] + OPTS + args,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            text=True
        )
        stdout, _ = process.communicate(input=input_str)
        return stdout.strip()

    except FileNotFoundError:
        print("Error: fzf not installed.")
        sys.exit(1)
