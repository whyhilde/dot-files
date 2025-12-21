from options import Cols


import shutil
import subprocess
import sys


class Init:
    @staticmethod
    def update_database():
        try:
            print(":: Updating repositories...")
            subprocess.run(["sudo", "pacman", "--noconfirm", "-Syu"], check=True)
            print(
                f"{Cols.INFO}[+] Repositories have been updated successfully.{Cols.END}"
            )

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error updating repositories: {e}{Cols.END}")
            sys.exit(1)

    @staticmethod
    def install_aur_helper():
        try:
            if shutil.which("yay"):
                print(f"{Cols.INFO}[+] yay is already installed.{Cols.END}")
                upgrade = input("Upgrade yay? (y/n): ").strip().lower()
                if upgrade == "y":
                    pass
                else:
                    return

            print(":: Installing yay...")

            print(":: Installing dependencies...")
            subprocess.run(
                [
                    "sudo",
                    "pacman",
                    "-S",
                    "--noconfirm",
                    "--needed",
                    "base-devel",
                    "git",
                ],
                check=True,
            )

            print(":: Cloning yay from AUR...")
            subprocess.run(
                ["sudo", "git", "clone", "https://aur.archlinux.org/yay.git", "/tmp/"],
                check=True,
            )

            print(":: Building yay...")
            subprocess.run(
                ["cd", "/tmp/yay", "&&", "makepkg", "-si", "--noconfirm"],
                check=True,
            )

            print(f"{Cols.INFO}[+] yay has been successfully installed.{Cols.END}")

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error when installing yay: {e}{Cols.END}")
            sys.exit(1)
