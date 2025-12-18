import sys


class Cols:
    ERROR = "\033[38;2;243;139;168m"
    WARN = "\033[38;2;249;226;175m"
    INFO = "\033[38;2;166;227;161m"
    HINT = "\033[38;2;137;180;250m"
    END = "\033[0m"


HEADER = f"""{Cols.HINT}
██╗    ██╗██╗  ██╗██╗   ██╗██╗  ██╗██╗██╗     ██████╗ ███████╗
██║    ██║██║  ██║╚██╗ ██╔╝██║  ██║██║██║     ██╔══██╗██╔════╝
██║ █╗ ██║███████║ ╚████╔╝ ███████║██║██║     ██║  ██║█████╗  
██║███╗██║██╔══██║  ╚██╔╝  ██╔══██║██║██║     ██║  ██║██╔══╝  
╚███╔███╔╝██║  ██║   ██║   ██║  ██║██║███████╗██████╔╝███████╗
 ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝╚═════╝ ╚══════╝
{Cols.END}"""


class UserInterface:
    @staticmethod
    def start_interface():
        print(HEADER)
        print(f"{Cols.HINT}Press ENTER to install (q to exit) {Cols.END}", end="")
        menu = input().strip().lower()
        return menu

    @staticmethod
    def is_verify_response(text) -> bool:
        if "y" in text.lower():
            return True
        elif "n" in text.lower():
            return False
        else:
            print(f"{Cols.ERROR}[-] Incorrect input.{Cols.END}")
            sys.exit(1)

    @staticmethod
    def get_params():
        print("1) Update Arch database? (y/n): ", end="")
        option_1 = UserInterface.is_verify_response(input())

        print("2) Install all packages? (y/n): ", end="")
        option_2 = UserInterface.is_verify_response(input())

        print("3) Install theme, icons, fonts? (y/n): ", end="")
        option_3 = UserInterface.is_verify_response(input())

        print("4) Install all dotfiles? (y/n): ", end="")
        option_4 = UserInterface.is_verify_response(input())

        print("5) Setup all patches? (y/n): ", end="")
        option_5 = UserInterface.is_verify_response(input())

        print("6) Make settings for NVIDIA? (y/n): ", end="")
        option_6 = UserInterface.is_verify_response(input())

        print("7) Enable all daemons? (y/n): ", end="")
        option_7 = UserInterface.is_verify_response(input())

        return [option_1, option_2, option_3, option_4, option_5, option_6, option_7]
