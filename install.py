# TODO: add function for configure browser (setup_browser)
# TODO: add function for set permissions for scripts (set_permissions_for_scripts)

import os
import sys
import subprocess
import shutil
from pathlib import Path
import tempfile
import getpass


class Cols:
    ERROR = "\033[38;2;243;139;168m"
    WARN = "\033[38;2;249;226;175m"
    INFO = "\033[38;2;166;227;161m"
    HINT = "\033[38;2;137;180;250m"
    END = "\033[0m"


VERSION = "1.1"
GITHUB = "https://github.com/whyhilde"
HEADER = f"""{Cols.HINT}
╦ ╦╦ ╦╦ ╦╦ ╦╦╦  ╔╦╗╔═╗  ╔╦╗╔═╗╔╦╗╔═╗╦╦  ╔═╗╔═╗
║║║╠═╣╚╦╝╠═╣║║   ║║║╣    ║║║ ║ ║ ╠╣ ║║  ║╣ ╚═╗
╚╩╝╩ ╩ ╩ ╩ ╩╩╩═╝═╩╝╚═╝  ═╩╝╚═╝ ╩ ╚  ╩╩═╝╚═╝╚═╝

Version: {VERSION}
GitHub: {GITHUB}
{Cols.END}"""


BASE_PACKAGES = [
    "hyprland",
    "hyprlock",
    "hyprpicker",
    "hyprpaper",
    "hypridle",
    "waybar",
    "rofi",
    "dunst",
    "git",
    "firefox",
    "telegram-desktop",
    "obsidian",
    "bitwarden",
    "spotify-launcher",
    "blender",
    "thunderbird",
    "neovim",
    "obs-studio",
    "ghostty",
    "fastfetch",
    "btop",
    "cava",
    "opendoas",
    "wireguard-tools",
    "nemo",
    "imv",
    "mpv",
    "pavucontrol",
    "grim",
    "slurp",
    "networkmanager",
    "network-manager-applet",
    "bluez",
    "blueman",
    "curl",
    "wget",
    "gzip",
    "unzip",
    "unrar",
]
DEV_PACKAGES = [
    "clang",
    "docker",
    "ffmpeg",
    "bat",
    "eza",
    "fzf",
    "git-delta",
    "zoxide",
    "ripgrep",
    "fd",
]
NVIDIA = [
    "linux-headers",
    "egl-wayland",
    "nvidia-dkms",
    "nvidia-settings",
    "nvidia-utils",
    "lib32-nvidia-utils",
]
INTEL = [
    "intel-ucode",
    "mesa",
    "vulkan-intel",
]
FONTS = [
    "ttf-jetbrains-mono",
    "ttf-meslo-nerd-font-powerlevel10k",
    "ttf-jetbrains-mono-nerd",
]
AUR_PACKAGES = [
    "papirus-folders-catppuccin-git",
    "catppuccin-gtk-theme-mocha",
    "catppuccin-cursors-mocha",
]


class BeforeInstalling:
    @staticmethod
    def update_system():
        try:
            print(":: Updating repositories...")
            subprocess.run(
                ["sudo", "pacman", "--noconfirm", "-Syu"],
                check=True,
                text=True,
                capture_output=True,
            )
            print(
                f"{Cols.INFO}[+] Repositories have been updated successfully.{Cols.END}"
            )
            return True

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error updating repositories: {e}{Cols.END}")
            return False

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

            temp_dir = "/tmp/yay-install"
            print(":: Creating a temporary directory...")
            if not subprocess.run(
                ["sudo", "rm", "-rf", temp_dir, "&&", "sudo", "mkdir", "-p", temp_dir],
                shell=True,
                check=True,
            ):
                return False

            print(":: Cloning yay from AUR...")
            if not subprocess.run(
                f"sudo git clone https://aur.archlinux.org/yay.git {temp_dir}"
            ):
                return False

            os.chdir(temp_dir)
            print(":: Building yay...")
            if not subprocess.run("makepkg -si --noconfirm"):
                return False

            print(":: Cleaning temporary files...")
            subprocess.run(f"sudo rm -rf {temp_dir}")

            if shutil.which("yay"):
                print(f"{Cols.INFO}[+] yay has been successfully installed.{Cols.END}")
                return True
            else:
                print(f"{Cols.ERROR}[-] yay was not installed.{Cols.END}")
                return False

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error when installing yay: {e}{Cols.END}")
            return False


class Installing:
    @staticmethod
    def install_fonts():
        try:
            print("Установка шрифтов...")
            for font in FONTS:
                subprocess.run(
                    ["yay", "-S", "--noconfirm", "--needed", font], check=True
                )
                print(f"{Cols.INFO}{font} установлен.{Cols.END}")

            print("Проверка установленных шрифтов...")
            result = subprocess.run(
                "fc-list | grep -E '(Meslo|JetBrains)'",
                shell=True,
                capture_output=True,
                text=True,
            )
            if result.stdout:
                print(f"{Cols.HINT}Найдены шрифты:{Cols.END}")
                print(result.stdout)
                return True
            else:
                print(f"{Cols.WARN}Шрифты не найдены в системе.{Cols.END}")
                return False

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка при установке шрифтов: {e}{Cols.END}")
            return False

        except Exception as e:
            print(f"{Cols.ERROR}Неожиданная ошибка: {e}{Cols.END}")
            return False

    @staticmethod
    def install(package_manager: str, packages: list):
        try:
            cmd = ["sudo", package_manager, "-S", "--noconfirm"] + packages
            subprocess.run(cmd, check=True, capture_output=True, text=True)
            print(f"{Cols.INFO}[+] Packages have been successfully installed.{Cols.END}")
            return True

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error when installing packages: {e}{Cols.END}")
            return False

        except Exception as e:
            print(f"{Cols.ERROR}[-] Unexpected error: {e}{Cols.END}")
            return False

    @staticmethod
    def install_packages():
        intel_input = (
            input("Install drivers for Intel CPU? [Y/n]: ").strip().upper()
        )
        if intel_input == "Y" or intel_input == "":
            print(":: Installing drivers for Intel...")
            if not Installing.install("pacman", INTEL):
                print(f"{Cols.ERROR}[-] Installation failed.{Cols.END}")
                return False
        elif intel_input == "N":
            pass
        else:
            print(f"{Cols.WARN}[-] Incorrect input. Skipping the driver installation.{Cols.END}")

        print(":: Installing basic packages...")
        if not Installing.install("pacman", BASE_PACKAGES):
            print(f"{Cols.ERROR}[-] Installation failed.{Cols.END}")
            return False

        print(":: Installing development packages...")
        if not Installing.install("pacman", DEV_PACKAGES):
            print(f"{Cols.ERROR}[-] Installation failed.{Cols.END}")
            return False

        print(":: Installing packages from AUR...")
        if not Installing.install("yay", AUR_PACKAGES):
            print(f"{Cols.ERROR}[-] Installation failed.{Cols.END}")
            return False

        return True


class SetupDots:
    @staticmethod
    def setup_configs():
        home_dir = Path.home()
        repo_dir = Path(__file__).parent

        user_config = home_dir / ".config"
        backup_config = home_dir / ".config_backup"
        repo_config = repo_dir / ".config"

        try:
            print(":: Updating configurations...")

            if not repo_config.exists():
                raise FileNotFoundError(
                    f"{Cols.ERROR}[-] Folder {repo_config} not found.{Cols.END}"
                )

            if backup_config.exists():
                shutil.rmtree(backup_config)

            if not user_config.exists():
                pass
            else:
                shutil.copytree(user_config, backup_config)
                print(
                    f"{Cols.HINT}[+] The backup was created in {backup_config}.{Cols.END}"
                )
                shutil.rmtree(user_config)

            shutil.copytree(repo_config, user_config)
            print(f"{Cols.INFO}[+] Configurations have been successfully updated.{Cols.END}")

        except Exception as e:
            print(f"{Cols.ERROR}[+] Error: {e}{Cols.END}")
            sys.exit(1)

    @staticmethod
    def setup_git():
        try:
            print(":: Configuring Git...")

            if not subprocess.run(["sudo", "pacman", "-S", "git"], check=True):
                return

            home_dir = Path.home()
            repo_dir = Path(__file__).parent
            source_file = repo_dir / "gitconfig"
            dest_file = home_dir / ".gitconfig"

            if source_file.exists():
                if dest_file.exists():
                    backup_file = f"{dest_file}_backup"
                    shutil.copy2(dest_file, backup_file)
                    print(f"{Cols.HINT}Создана копия: {backup_file}{Cols.END}")

                shutil.copy2(source_file, dest_file)
                print(f"{Cols.INFO}{dest_file} успешно обновлен!{Cols.END}")
            else:
                raise FileNotFoundError(
                    f"{Cols.ERROR}Файл {source_file} не найден.{Cols.END}"
                )

            print(f"{Cols.INFO}Git успешно настроен!{Cols.END}")

        except Exception as e:
            print(f"{Cols.ERROR}Ошибка: {e}{Cols.END}")

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка выполнения команды: {e}{Cols.END}")


class Patches:
    @staticmethod
    def change_shell():
        try:
            subprocess.run(
                ["sudo", "pacman", "-S", "--noconfirm", "fish", "starship"], check=True
            )

            fish_path = shutil.which("fish")
            if not fish_path:
                print(f"{Cols.WARN}Повторяем установку fish...{Cols.END}")
                subprocess.run(
                    ["sudo", "pacman", "-S", "--noconfirm", "fish"], check=True
                )
            else:
                subprocess.run(["chsh", "-s", fish_path], check=True)
                print(f"{Cols.INFO}Оболочка изменена успешно!{Cols.END}")

            starship_path = shutil.which("starship")
            if not starship_path:
                print(f"{Cols.WARN}Повторяем установку starship...{Cols.END}")
                subprocess.run(
                    ["sudo", "pacman", "-S", "--noconfirm", "starship"], check=True
                )
            else:
                print(f"{Cols.INFO}Starship успешно установлен!{Cols.END}")

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка выполнения команды: {e}{Cols.END}")

    @staticmethod
    def autologin():
        try:
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

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка: {e}{Cols.END}")

    @staticmethod
    def configure_nvidia():
        print("Настройка видеокарты NVIDIA...")

        print("Установка драйверов...")
        if not Installing.install("pacman", NVIDIA):
            print(f"{Cols.ERROR}Установка драйверов неудалась.{Cols.END}")
            return False

        print("Настройка для Wayland...")
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

            return True

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка: {e}{Cols.END}")
            return False

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
            print(f"{Cols.ERROR}Ошибка: {e}{Cols.END}")

    @staticmethod
    def enable_network():
        try:
            subprocess.run(
                ["sudo", "systemctl", "enable", "NetworkManager"], check=True
            )
            subprocess.run(["sudo", "systemctl", "start", "NetworkManager"], check=True)
        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка при активации NetworkManager: {e}{Cols.END}")

    @staticmethod
    def enable_bluetooth():
        try:
            subprocess.run(
                ["sudo", "systemctl", "enable", "bluetooth.service"], check=True
            )
            subprocess.run(
                ["sudo", "systemctl", "start", "bluetooth.service"], check=True
            )
        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка при активации bluetooth: {e}{Cols.END}")

    @staticmethod
    def create_default_folders():
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
            path = Path(folder)
            path.mkdir(parents=True, exist_ok=True)
        print(
            f"{Cols.INFO}[+] The default folders were created successfully.{Cols.END}"
        )


def main():
    try:
        print(f"{HEADER}")
        menu = (
            input(f"{Cols.HINT}Press ENTER to install (q to exit){Cols.END} ")
            .strip()
            .upper()
        )

        if menu == "":
            if not BeforeInstalling.update_system():
                sys.exit(1)
            if not BeforeInstalling.install_aur_helper():
                sys.exit(1)

            if not Installing.install_packages():
                sys.exit(1)
            if not Installing.install_fonts():
                sys.exit(1)

            SetupDots.setup_configs()
            SetupDots.setup_git()

            Patches.change_shell()
            Patches.autologin()

            nvidia_input = input("Make settings for NVIDIA? [Y/n]: ").strip().upper()
            if nvidia_input == "Y" or nvidia_input == "":
                if not Patches.configure_nvidia():
                    print(f"{Cols.ERROR}[-] Setup failed.{Cols.END}")
                    sys.exit(1)
            elif nvidia_input == "N":
                pass
            else:
                print(f"{Cols.ERROR}[-] Error: incorrect input.{Cols.END}")
                sys.exit(1)

            Patches.configure_opendoas()
            Patches.enable_network()
            Patches.enable_bluetooth()
            Patches.create_default_folders()

            print(f"{Cols.INFO}[+] The installation is complete.{Cols.END}")

        elif menu == "Q":
            sys.exit()

        else:
            print(f"{Cols.ERROR}[-] Incorrect input.{Cols.END}")
            sys.exit(1)

    except KeyboardInterrupt:
        sys.exit(1)


if __name__ == "__main__":
    main()
