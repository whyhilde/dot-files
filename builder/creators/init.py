from options import Cols


import shutil
import subprocess


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

    @staticmethod
    def install_aur_helper():
        try:
            if shutil.which("yay"):
                print(f"{Cols.INFO}[+] yay is already installed.{Cols.END}")
                return True

            print(":: Installing yay...")

            print(":: Installing dependencies...")
            if not subprocess.run(
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
            ):
                return False

            print(":: Cloning yay from AUR...")
            if not subprocess.run(
                ["sudo", "git", "clone", "https://aur.archlinux.org/yay.git", "/tmp/"],
                check=True,
            ):
                return False

            print(":: Building yay...")
            if not subprocess.run(
                ["cd", "/tmp/yay", "&&", "makepkg", "-si", "--noconfirm"]
            ):
                return False

            print(f"{Cols.INFO}[+] yay has been successfully installed.{Cols.END}")
            return True

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error when installing yay: {e}{Cols.END}")
            return False
