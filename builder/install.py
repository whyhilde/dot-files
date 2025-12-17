from options import UserInterface
from options import Cols
from creators.init import Init
from creators.software import Software
from creators.dotfiles import Dotfiles
from creators.patches import Patches
from creators.daemons import Daemons


import sys


def main():
    try:
        menu = UserInterface.start_interface()
        if menu == "":
            options = UserInterface.get_params()

            if options[0]:
                Init.update_database()

            if not Init.install_aur_helper():
                sys.exit(1)

            if options[1]:
                if not Software.install_all_packages():
                    sys.exit(1)

            if options[2]:
                if not Patches.setup_fonts():
                    sys.exit(1)

            if options[3]:
                Dotfiles.setup_all_dotfiles()

            if options[4]:
                Patches.setup_all_patches()

            if options[5]:
                if not Patches.configure_nvidia():
                    sys.exit(1)

            if options[6]:
                Daemons.enable_all_daemons()

        elif menu == "q":
            sys.exit()

        else:
            print(f"{Cols.ERROR}[-] Incorrect input.{Cols.END}")
            sys.exit(1)

    except KeyboardInterrupt:
        sys.exit(1)


if __name__ == "__main__":
    main()
