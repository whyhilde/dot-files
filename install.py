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


HEADER = f"""{Cols.HINT}
░█░█░█░█░█░█░█░█░▀█▀░█░░░█▀▄░█▀▀░░░█▀▄░█░█░▀█▀░█░░░█▀▄░█▀▀░█▀▄
░█▄█░█▀█░░█░░█▀█░░█░░█░░░█░█░█▀▀░░░█▀▄░█░█░░█░░█░░░█░█░█▀▀░█▀▄
░▀░▀░▀░▀░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀░░▀▀▀░░░▀▀░░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀▀▀░▀░▀
{Cols.END}"""


BASE_PACKAGES = [ "xmonad", "xmonad-contrib", "ghc", "rofi", "dunst", "git", "firefox", "telegram-desktop", "obsidian", "bitwarden", "blender", "thunderbird", "neovim", "obs-studio", "ghostty", "fastfetch", "cmus", "btop", "cava", "opendoas", "wireguard-tools", "nemo", "feh", "pavucontrol", "flameshot", "gpick", "networkmanager", "network-manager-applet", "bluez", "blueman", "curl", "wget", "gzip", "unzip", "unrar", "xorg-xrandr", "xorg-xset", "xorg-setxkbmap", "xorg-xev", "xorg-xprop", "xorg-xmessage", ]
DEV_PACKAGES = [ "clang", "docker", "ffmpeg", "tmux", "bat", "eza", "fzf", "thefuck", "git-delta", "zoxide", "tldr", "ripgrep", "fd", ]
DRIVERS = [ "nvidia", "nvidia-settings", "nvidia-utils", "lib32-nvidia-utils", "intel-ucode", "mesa", "vulkan-intel", ]
FONTS = [ "ttf-jetbrains-mono", "ttf-meslo-nerd-font-powerlevel10k", "ttf-jetbrains-mono-nerd", ]
AUR_PACKAGES = [ "picom-pijulius-next-git", "papirus-folders-catppuccin-git", "catppuccin-gtk-theme-mocha", ]


class StartInstalling:
    @staticmethod
    def updateRepositories():
        try:
            result = subprocess.run(
                ["sudo", "pacman", "--noconfirm", "-Syu"],
                check=True,
                text=True,
                capture_output=True,
            )
            print(f"{Cols.INFO}Репозитории успешно обновлены!{Cols.END}")
            return True

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка при обновлении репозиториев: {e}{Cols.END}")
            print(f"Stderr: {e.stderr}")
            return False

    @staticmethod
    def installAurHelper():
        print("Установка yay...")

        # check if yay is installed
        if shutil.which("yay"):
            print(f"{Cols.INFO}yay уже установлен!{Cols.END}")
            return True

        # install necessary dependencies
        print("Установка зависимостей...")
        if not subprocess.run(
            ["sudo", "pacman", "-S", "--noconfirm", "--needed", "base-devel", "git"],
            check=True,
        ):
            return False

        # creating temporary directory and cloning yay
        temp_dir = "/tmp/yay-install"
        print("Создание временной директории...")
        if not subprocess.run(
            ["sudo", "rm", "-rf", temp_dir, "&&", "sudo", "mkdir", "-p", temp_dir],
            shell=True,
            check=True,
        ):
            return False

        print("Клонирование yay из AUR...")
        if not subprocess.run(
            f"sudo git clone https://aur.archlinux.org/yay.git {temp_dir}"
        ):
            return False

        # переходим в директорию и собираем пакет
        os.chdir(temp_dir)
        print("Сборка yay...")
        if not subprocess.run("makepkg -si --noconfirm"):
            return False

        # очищаем временные файлы
        print("Очистка временных файлов...")
        subprocess.run(f"sudo rm -rf {temp_dir}")

        # проверяем установку
        if shutil.which("yay"):
            print(f"{Cols.INFO}yay успешно установлен!{Cols.END}")
            return True
        else:
            print(f"{Cols.ERROR}yay не был установлен!{Cols.END}")
            return False


class Installing:
    @staticmethod
    def installFonts():
        try:
            for font in FONTS:
                print(f"Установка {font}...")
                subprocess.run(["yay", "-S", "--noconfirm", "--needed", font], check=True)
        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка при установке шрифтов: {e}{Cols.END}")
            print(f"{Cols.ERROR}Stderr: {e.stderr}{Cols.END}")
            return False
        except Exception as e:
            print(f"{Cols.ERROR}Неожиданная ошибка: {e}{Cols.END}")
            return False

        print("Проверка установленных шрифтов...")
        try:
            result = subprocess.run(
                "fc-list | grep -E '(Meslo|JetBrains)'",
                shell=True,
                capture_output=True,
                text=True,
            )
            if result.stdout:
                print(f"{Cols.HINT}Найдены шрифты:{Cols.END}")
                print(result.stdout)
            else:
                print(f"{Cols.WARN}Шрифты не найдены в системе.{Cols.END}")
        except Exception as e:
            print(f"{Cols.ERROR}Ошибка при проверке шрифтов: {e}{Cols.END}")

    @staticmethod
    def install(package_manager: str, packages):
        try:
            cmd = ["sudo", package_manager, "-S", "--noconfirm"] + packages
            result = subprocess.run(cmd, check=True, capture_output=True, text=True)
            print(f"{Cols.INFO}Пакеты успешно установлены!{Cols.END}")
            return True
        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка при установке пакетов: {e}{Cols.END}")
            print(f"{Cols.ERROR}Stderr: {e.stderr}{Cols.END}")
            return False
        except Exception as e:
            print(f"{Cols.ERROR}Неожиданная ошибка: {e}{Cols.END}")
            return False
    
    @staticmethod
    def installPackages():
        drivers_input = input("Установить драйвера для Intel & NVIDIA? Y/n ~> ").strip().upper()
        if drivers_input == "Y" or drivers_input == "":
            print("Установка драйверов...")
            Installing.install("pacman", DRIVERS)
        elif drivers_input == "N":
            pass
        else:
            print(f"{Cols.WARN}Неверный ввод. Пропуск установки драйверов.{Cols.END}")

        print("Установка пакетов:")
        Installing.install("pacman", BASE_PACKAGES)

        print("Установка пакетов из AUR:")
        Installing.install("yay", AUR_PACKAGES)

        dev_packages_input = input("Установить пакеты для разработки? Y/n ~> ").strip().upper()
        if dev_packages_input == "Y" or dev_packages_input == "":
            print("Установка пакетов...")
            Installing.install("pacman", DEV_PACKAGES)
        elif dev_packages_input == "N":
            pass
        else:
            print(f"{Cols.WARN}Неверный ввод. Пропуск установки пакетов.{Cols.END}")


class ConfigureSystem:
    @staticmethod
    def changeShell():
        user_input = input("Сменить shell на zsh? Y/n ~> ").strip().upper()
        if user_input == "Y" or user_input == "":
            try:
                subprocess.run(
                    ["sudo", "pacman", "-S", "--noconfirm", "zsh", "starship"], check=True
                )

                zsh_path = shutil.which("zsh")
                if not zsh_path:
                    print(f"{Cols.WARN}Повторяем установку zsh..{Cols.END}")
                    subprocess.run(
                        ["sudo", "pacman", "-S", "--noconfirm", "zsh"], check=True
                    )
                else:
                    subprocess.run(["chsh", "-s", zsh_path], check=True)
                    print(f"{Cols.INFO}Оболочка изменена успешно!{Cols.END}")

                starship_path = shutil.which("starship")
                if not starship_path:
                    print(f"{Cols.WARN}Повторяем установку starship..{Cols.END}")
                    subprocess.run(
                        ["sudo", "pacman", "-S", "--noconfirm", "starship"], check=True
                    )
                else:
                    print(f"{Cols.INFO}Starship успешно установлен!{Cols.END}")
                    return True

            except subprocess.CalledProcessError as e:
                print(f"{Cols.ERROR}Ошибка выполнения команды: {e}{Cols.END}")
                return False

        elif user_input == "N":
            return False
        else:
            print(f"{Cols.WARN}Неверный ввод. Пропуск смены shell.{Cols.END}")
            return False

    @staticmethod
    def installOhMyZsh():
        try:
            home_dir = str(Path.home())
            zsh_custom = os.environ.get("ZSH_CUSTOM", f"{home_dir}/.oh-my-zsh/custom")
            os.makedirs(zsh_custom, exist_ok=True)
            subprocess.run([
                    "curl",
                    "-fsSL",
                    "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh",
                    "-o",
                    "/tmp/install_ohmyzsh.sh",
                ], check=True,
            )
            subprocess.run(
                ["sh", "/tmp/install_ohmyzsh.sh", "--unattended"], check=True
            )

            # cloning repositories
            repos = [
                #                ("https://github.com/romkatv/powerlevel10k.git", f"{zsh_custom}/themes/powerlevel10k"),
                (
                    "https://github.com/zsh-users/zsh-syntax-highlighting.git",
                    f"{zsh_custom}/plugins/zsh-syntax-highlighting",
                ),
                (
                    "https://github.com/zsh-users/zsh-autosuggestions",
                    f"{zsh_custom}/plugins/zsh-autosuggestions",
                ),
            ]
            for repo_url, target_dir in repos:
                os.makedirs(os.path.dirname(target_dir), exist_ok=True)
                subprocess.run(
                    ["git", "clone", "--depth=1", repo_url, target_dir], check=True
                )

        except subprocess.CalledProcessError as e:
                print(f"{Cols.ERROR}Ошибка выполнения команды: {e}{Cols.END}")

        except Exception as e:
                print(f"{Cols.ERROR}Неожиданная ошибка: {e}{Cols.END}")

    @staticmethod
    def changeCursors():
        user_input = input("Сменить тему курсоров? Y/n ~> ").strip().upper()
        if user_input == "Y" or user_input == "":
            try:
                # installing cursors
                subprocess.run(["yay", "-S", "--noconfirm", "catppuccin-cursors-mocha"])

                # change cursors theme
                with open(os.path.expanduser("~/.Xresources"), "a") as f:
                    f.write(f"Xcursor.theme: catppuccin-mocha-light-cursors\n")

                print(f"{Cols.INFO}Курсоры изменены успешно!{Cols.END}")
                return True

            except Exception as e:
                print(f"{Cols.ERROR}Ошибка при изменении курсоров: {e}{Cols.END}")
                return False

        elif user_input == "N":
            pass
        else:
            print(f"{Cols.WARN}Неверный ввод. Пропуск смены курсоров.{Cols.END}")

    @staticmethod
    def setupDotfiles():
        repo_url = "https://github.com/whyhilde/dot-files"
        home_dir = Path.home()
        config_dir = home_dir / ".config"
        config_backup = home_dir / ".config.backup"

        # Создаем временную директорию для клонирования
        with tempfile.TemporaryDirectory() as temp_dir:
            temp_path = Path(temp_dir)

            try:
                # клонируем репозиторий
                print(f"Клонируем репозиторий {repo_url}...")
                result = subprocess.run(
                    ["git", "clone", repo_url, temp_path],
                    capture_output=True,
                    text=True,
                    check=True,
                )
                print(f"{Cols.INFO}Репозиторий успешно скопирован!{Cols.END}")

                repo_config = temp_path / ".config"
                if repo_config.exists():
                    # создаем backup текущего .config если он существует
                    if config_dir.exists():
                        print("Создание копий текущих конфигураций...")
                        if config_backup.exists():
                            shutil.rmtree(config_backup)
                        shutil.copytree(config_dir, config_backup)
                        print(f"{Cols.INFO}Backup создан в {config_backup}{Cols.END}")

                        # удаляем оригинальный .config
                        print("Удаляем текущии конфигурации...")
                        shutil.rmtree(config_dir)

                    # копируем .config из репозитория
                    print("Копирование конфигураций из репозитория...")
                    shutil.copytree(repo_config, config_dir)
                    print(f"{Cols.INFO}Конфигурации успешно обновлены!{Cols.END}")
                else:
                    print(
                        f"{Cols.WARN}Директория с конфигурациями не найдена в репозитории.{Cols.END}"
                    )

                # копируем файлы из репозитория
                files_to_copy = [
                    ".zshrc",
                    ".p10k.zsh",
                    ".tmux.conf",
                    "git/.gitconfig",
                    ".xinitrc",
                    ".zprofile",
                ]
                print("Копирование остальных конфигов...")

                for file_name in files_to_copy:
                    source_file = temp_path / file_name
                    dest_file = home_dir / Path(file_name).name

                    if source_file.exists():
                        # создаем backup если файл уже существует
                        if dest_file.exists():
                            backup_file = home_dir / f"{file_name}.backup"
                            shutil.copy2(dest_file, backup_file)
                            print(f"{Cols.HINT}Создана копия: {backup_file}{Cols.END}")

                        # копируем файл
                        shutil.copy2(source_file, dest_file)
                        print(f"{Cols.INFO}{file_name} успешно обновлен!{Cols.END}")
                    else:
                        print(
                            f"{Cols.WARN}Файл {file_name} не найден в репозитории.{Cols.END}"
                        )

                print(f"{Cols.INFO}Все конфиги успешно обновленны!{Cols.END}")

            except subprocess.CalledProcessError as e:
                print(f"{Cols.ERROR}Ошибка при клонировании репозитория: {e}{Cols.END}")
                print(f"Stderr: {e.stderr}")
                raise

            except Exception as e:
                print(f"{Cols.ERROR}Произошла ошибка: {e}{Cols.END}")
                raise

    @staticmethod
    def autologin():
        try:
            username = getpass.getuser()
            content = f"""[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin {username} --noclear %I $TERM
    """
            subprocess.run(
                ["sudo", "mkdir", "-p", "/etc/systemd/system/getty@tty1.service.d/"],
                check=True,
            )
            subprocess.run(
                ["sudo", "tee", "/etc/systemd/system/getty@tty1.service.d/autologin.conf"],
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
    def opendoas():
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
    def network():
        try:
            subprocess.run(["sudo", "systemctl", "enable", "NetworkManager"], check=True)
            subprocess.run(["sudo", "systemctl", "start", "NetworkManager"], check=True)
        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка при активации NetworkManager: {e}{Cols.END}")

    @staticmethod
    def bluetooth():
        try:
            subprocess.run(["sudo", "systemctl", "enable", "bluetooth.service"], check=True)
            subprocess.run(["sudo", "systemctl", "start", "bluetooth.service"], check=True)
        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка при активации bluetooth: {e}{Cols.END}")


def main():
    try:
        print(f"{HEADER}")
        menu = input(
            f"{Cols.HINT}Press ENTER to install (q to exit){Cols.END} "
        ).strip().upper()

        if menu == "":
            if StartInstalling.updateRepositories():
                if StartInstalling.installAurHelper():

                    Installing.installFonts()
                    Installing.installPackages()

                    ConfigureSystem.changeShell()
                    ConfigureSystem.installOhMyZsh()
                    ConfigureSystem.changeCursors()
                    ConfigureSystem.setupDotfiles()
                    ConfigureSystem.autologin()
                    ConfigureSystem.opendoas()
                    ConfigureSystem.network()
                    ConfigureSystem.bluetooth()

                    print(f"{Cols.INFO}Installation is complete!{Cols.END}")

        elif menu == "Q":
            sys.exit()

        else:
            print(f"{Cols.ERROR}Неправильный ввод!{Cols.END}")
            sys.exit(1)

    except KeyboardInterrupt:
        sys.exit(1)


if __name__ == "__main__":
    main()
