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

            Init.install_aur_helper()

            if options[1]:
                Software.install_all_packages()

            if options[2]:
                Patches.apply_appearance()

            if options[3]:
                Dotfiles.setup_all_dotfiles()

            if options[4]:
                Patches.setup_all_patches()

            if options[5]:
                Patches.configure_nvidia()

            if options[6]:
                Daemons.enable_all_daemons()

        elif menu == "q":
            sys.exit()

        else:
            raise ValueError("Incorrect input")

    except ValueError as e:
        print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
        sys.exit(1)

    except KeyboardInterrupt:
        sys.exit(1)


if __name__ == "__main__":
    main()
