import packages
from options import Cols
from creators.software import Software


import subprocess
import os
import sys
import getpass


class Patches:
    @staticmethod
    def setup_all_patches():
        Patches.change_shell()
        Patches.setup_autologin()
        Patches.configure_opendoas()
        Patches.set_scripts_permissions()
        Patches.create_default_folders()
        Patches.set_theme_for_btop()

    @staticmethod
    def change_shell():
        try:
            print(":: Changing the shell...")
            subprocess.run(["chsh", "-s", "$(which fish)"], check=True)
            print(
                    f"{Cols.INFO}[+] The shell has been changed successfully.{Cols.END}"
                )

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error when changing shell: {e}.{Cols.END}")
            sys.exit(1)

    @staticmethod
    def setup_autologin():
        try:
            print(":: Setting up an autologin...")

            username = getpass.getuser()
            content = f"""[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin {username} --noclear %I $TERM"""

            subprocess.run(
                ["sudo", "mkdir", "-p", "/etc/systemd/system/getty@tty1.service.d/"],
                check=True,
            )
            subprocess.run(
                [
                    "sudo",
                    "tee",
                    "/etc/systemd/system/getty@tty1.service.d/autologin.conf",
                ],
                input=content,
                text=True,
                check=True,
            )
            subprocess.run(
                ["sudo", "systemctl", "enable", "getty@tty1.service"], check=True
            )
            subprocess.run(["sudo", "systemctl", "daemon-reload"], check=True)

            print(
                f"{Cols.INFO}[+] Autologin has been successfully configured.{Cols.END}"
            )

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

    @staticmethod
    def configure_nvidia():
        print(":: Configuring the NVIDIA graphics card...")

        print(":: Installing drivers...")
        Software.install_packages(packages.DEFAULT_CMD, packages.NVIDIA)

        print(":: Setting up for Wayland...")
        try:
            content = "options nvidia_drm modeset=1"

            subprocess.run(
                ["sudo", "mkdir", "-p", "/etc/modprobe.d/"],
                check=True,
            )
            subprocess.run(
                ["sudo", "tee", "/etc/modprobe.d/nvidia.conf"],
                input=content,
                text=True,
                check=True,
            )

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

    @staticmethod
    def configure_opendoas():
        try:
            username = getpass.getuser()
            content = f"permit persist {username}"
            subprocess.run(
                ["sudo", "tee", "/etc/doas.conf"],
                input=content,
                text=True,
                check=True,
            )

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

    @staticmethod
    def set_scripts_permissions():
        try:
            print(":: Setting permissions for scripts...")

            scripts_dir = os.path.expanduser("~/.config/hypr/scripts")
            if not os.path.exists(scripts_dir):
                raise FileNotFoundError(f"The {scripts_dir} directory was not found.")

            subprocess.run(["chmod", "744", f"{scripts_dir}/*.sh"], check=True)

            # sh_files = glob.glob(os.path.join(scripts_dir, "*.sh"))
            # if not sh_files:
            #     raise FileNotFoundError("No scripts were found.")

            # for file_path in sh_files:
            #     os.chmod(file_path, 0o744)

            print(
                f"{Cols.INFO}[+] Scripts permissions have been successfully set.{Cols.END}"
            )

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

        except FileNotFoundError as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

    @staticmethod
    def create_default_folders():
        try:
            print(":: Creating default folders...")
            default_folders = [
                "~/Videos",
                "~/Pictures",
                "~/Documents",
                "~/Downloads",
                "~/Music",
                "~/Desktop",
            ]
            for folder in default_folders:
                subprocess.run(["mkdir", "-p", folder], check=True)
            print(
                f"{Cols.INFO}[+] The default folders were created successfully.{Cols.END}"
            )

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

    @staticmethod
    def set_theme_for_btop():
        try:
            print(":: Setting theme for btop...")

            url = "https://raw.githubusercontent.com/catppuccin/btop/refs/heads/main/themes/catppuccin_mocha.theme"
            output_file = "~/.config/btop/themes/catppuccin.theme"

            subprocess.run(["mkdir", "-p", "~/.config/btop/themes/"], check=True)
            subprocess.run(["curl", "-o", output_file, url], check=True)

            print(f"{Cols.INFO}[+] Theme have been successfully changed.{Cols.END}")

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

    @staticmethod
    def apply_appearance():
        try:
            print(":: Installing themes...")

            DEFAULT = [
                "ttf-jetbrains-mono",
                "ttf-jetbrains-mono-nerd",
            ]
            AUR = [
                "catppuccin-cursors-mocha",
                "catppuccin-gtk-theme-mocha",
                "papirus-folders-catppuccin-git",
                "ttf-meslo-nerd-font-powerlevel10k",
            ]

            subprocess.run(packages.DEFAULT_CMD + DEFAULT, check=True)
            subprocess.run(packages.AUR_CMD + AUR, check=True)

            print(f"{Cols.INFO}[+] Themes have been successfully installed.{Cols.END}")

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error when installing themes: {e}.{Cols.END}")
            sys.exit(1)

        except Exception as e:
            print(f"{Cols.ERROR}[-] Unexpected error: {e}{Cols.END}")
            sys.exit(1)
