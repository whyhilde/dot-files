import subprocess
import sys
import urllib.parse
import webbrowser


import fzf


ENGINES = {
    "aw archwiki": "https://wiki.archlinux.org/index.php?search={query}",
    "ap arch packages": "https://archlinux.org/packages/?sort=&q={query}",
    "ur aur": "https://aur.archlinux.org/packages?K={query}",
    "py perplexity": "https://www.perplexity.ai/search?q={query}",
    "dd duckduckgo": "https://duckduckgo.com/?t=ffab&q={query}",
    "gg google": "https://www.google.com/search?q={query}",
    "gh github": "https://github.com/search?q={query}&type=repositories",
    "yt youtube": "https://www.youtube.com/results?search_query={query}"
}


def get_query():
    process = subprocess.Popen(
        ["fzf", "--print-query"] + fzf.OPTS,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        text=True
    )
    stdout, _ = process.communicate(input="")
    lines = stdout.strip().split("\n")
    return lines[0] if lines else None


def main():
    engines = list(ENGINES.keys())
    selected = fzf.run(engines, [])
    
    if not selected or selected not in ENGINES:
        sys.exit(0)

    query = get_query()
    
    if not query:
        sys.exit(0)

    url_template = ENGINES[selected]
    safe_query = urllib.parse.quote_plus(query)
    url = url_template.format(query=safe_query)

    webbrowser.open(url)


if __name__ == "__main__":
    main()
