import subprocess
import sys


OPTS = [
    "--style=minimal",
    "--info=hidden",
    "--reverse",
    "--cycle",
    "--prompt=> ",
    "--ghost=type & search",
    "--color=spinner:white,hl:red",
    "--color=header:red,info:magenta,pointer:blue",
    "--color=marker:magenta,fg+:blue,prompt:blue,hl+:red",
    "--color=selected-bg:black",
    "--color=border:black,label:blue",
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
