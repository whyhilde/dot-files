import os
import sys
import subprocess
import shutil
from pathlib import Path
import tempfile


class Cols:
    ERROR = "\033[38;2;243;139;168m"
    WARN = "\033[38;2;249;226;175m"
    INFO = "\033[38;2;166;227;161m"
    HINT = "\033[38;2;137;180;250m"
    END = "\033[0m"


banner = f"""{Cols.HINT}
██╗    ██╗██╗  ██╗██╗   ██╗██╗  ██╗██╗██╗     ██████╗ ███████╗
██║    ██║██║  ██║╚██╗ ██╔╝██║  ██║██║██║     ██╔══██╗██╔════╝
██║ █╗ ██║███████║ ╚████╔╝ ███████║██║██║     ██║  ██║█████╗  
██║███╗██║██╔══██║  ╚██╔╝  ██╔══██║██║██║     ██║  ██║██╔══╝  
╚███╔███╔╝██║  ██║   ██║   ██║  ██║██║███████╗██████╔╝███████╗
 ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝╚═════╝ ╚══════╝
configuration builder
version: 1.0 // github: https://github.com/whyhilde
{Cols.END}"""


SOFTWARE = [ "qtile", "rofi", "sddm", "dunst", "git", "firefox", "telegram-desktop", "obsidian", "bitwarden", "blender", "inkscape", "thunderbird", "neovim", "micro", "obs-studio", "libreoffice-fresh", "libreoffice-fresh-ru", "ghostty", "cmus", "cava", "opendoas" ]
DEV_PACKAGES = [ "tmux", "btop", "bat", "eza", "fzf", "thefuck", "git-delta", "zoxide", "tldr", "ripgrep" ]
BASE_PACKAGES = [ "nautilus", "feh", "pavucontrol", "flameshot", "setxkbmap", "network-manager-applet", "python-iwlib", "gnupg", "xorg-xev" ]
DRIVERS = [ "nvidia", "nvidia-settings", "nvidia-utils", "intel-ucode", "mesa", "vulkan-intel" ]
FONTS = [ "ttf-jetbrains-mono", "ttf-meslo-nerd-font-powerlevel10k", "ttf-jetbrains-mono-nerd", "ttf-noto-sans-cjk-vf" ]
AUR_PACKAGES = [ "picom-pijulius-next-git", "neofetch", "tty-clock", "light", "papirus-folders-catppuccin-git", "catppuccin-cursors-mocha", "catppuccin-gtk-theme-mocha" ]




def update_repositories():
    try:
        result = subprocess.run(
            ["pacman", "-Sy"], check = True, text = True, capture_output = True
        )
        print(result.stdout)
        print(f"{Cols.INFO}Репозитории успешно обновлены!{Cols.END}")
        return True

    except subprocess.CalledProcessError as e:
        print(f"{Cols.ERROR}Ошибка при обновлении репозиториев: {e}{Cols.END}")
        print(f"Stderr: {e.stderr}")
        return False




def install_yay():
    print(f"{Cols.HINT}Установка yay...{Cols.END}")
    
    # проверяем, установлен ли yay
    check_yay = subprocess.run("which yay", shell = True, capture_output = True, text = True)
    if check_yay.returncode == 0:
        print(f"{Cols.INFO}yay уже установлен!{Cols.END}")
        return True
    
    # устанавлием необходимые зависимости
    print("Установка зависимостей...")
    if not run_command("sudo pacman -S --needed --noconfirm base-devel git"):
        return False
    
    # создаем временную директорию и клонируем yay
    temp_dir = "/tmp/yay-install"
    print("Создание временной директории...")
    if not run_command(f"rm -rf {temp_dir} && mkdir -p {temp_dir}"):
        return False
    
    print("Клонирование yay из AUR...")
    if not run_command(f"git clone https://aur.archlinux.org/yay.git {temp_dir}"):
        return False
    
    # переходим в директорию и собираем пакет
    os.chdir(temp_dir)
    print("Сборка yay...")
    if not run_command("makepkg -si --noconfirm"): 
        return False
    
    # очищаем временные файлы
    print("Очистка временных файлов...")
    run_command(f"rm -rf {temp_dir}")
    
    # проверяем установку
    check_install = subprocess.run("which yay", shell = True, capture_output = True, text = True)
    if check_install.returncode == 0:
        print(f"{Cols.INFO}yay успешно установлен!{Cols.END}")
        return True
    else:
        print(f"{Cols.ERROR}yay не был установлен!{Cols.END}")
        return False




def install_fonts():
    try:
        for font in FONTS:
            print(f"Установка {font}...")
            subprocess.run(["yay", "-S", font, "--noconfirm", "--needed"], check =  True)
    
    except subprocess.CalledProcessError as e:
        print(f"{Cols.ERROR}Ошибка при установке шрифтов: {e}{Cols.END}")
        print(f"{Cols.ERROR}Stderr: {e.stderr}{Cols.END}")
        return False

    except Exception as e:
        print(f"{Cols.ERROR}Неожиданная ошибка: {e}{Cols.END}")
        return False
    
    print("\nПроверка установленных шрифтов...")
    try:
        result = subprocess.run("fc-list | grep -E '(Meslo|JetBrains|Noto)'",
                                shell = True, capture_output = True, text = True)
        if result.stdout:
            print(f"{Cols.HINT}Найдены шрифты:{Cols.END}")
            print(result.stdout)
        else:
            print(f"{Cols.WARN}Шрифты не найдены в системе.{Cols.END}")

    except Exception as e:
        print(f"{Cols.ERROR}Ошибка при проверке шрифтов: {e}{Cols.END}")




def install_packages(packages):
    try:
        cmd = ["pacman", "-S", "--noconfirm"] + packages
        
        # Выполняем команду
        result = subprocess.run(cmd, check = True, capture_output = True, text = True)
        print(f"{Cols.INFO}Пакеты успешно установлены!{Cols.END}")
        return True

    except subprocess.CalledProcessError as e:
        print(f"{Cols.ERROR}Ошибка при установке пакетов: {e}{Cols.END}")
        print(f"{Cols.ERROR}Stderr: {e.stderr}{Cols.END}")
        return False

    except Exception as e:
        print(f"{Cols.ERROR}Неожиданная ошибка: {e}{Cols.END}")
        return False




def install_programs():
    drivers_input = input("Установить драйвера (Intel & NVIDIA)? [Y/n] ").strip().upper()
    if drivers_input == "Y" or drivers_input == "":
        print("Установка драйверов...")
        install_packages(DRIVERS)
    elif drivers_input == "N":
        pass
    else:
        print(f"{Cols.WARN}Неверный ввод. Пропуск установки драйверов.{Cols.END}")

    print("Установка базовых пакетов:")
    for pack in BASE_PACKAGES():
        print(f"- {pack}")
    install_packages(BASE_PACKAGES)

    print("Установка программ:")
    for program in SOFTWARE():
        print(f"- {program}")
    install_packages(SOFTWARE)

    dev_packages_input = input("Установить пакеты для разработки? [Y/n] ")
    if dev_packages_input == "Y" or dev_packages_input == "":
        print("Установка пакетов...")
        install_packages(DEV_PACKAGES)
    elif drivers_input == "N":
        pass
    else:
        print(f"{Cols.WARN}Неверный ввод. Пропуск установки пакетов.{Cols.END}")




def change_shell():
    user_input = input("Сменить shell на zsh? [Y/n] ").strip().upper()
    if user_input == "Y" or user_input == "":
        try:
            subprocess.run(["pacman", "-S", "--noconfirm", "zsh"], check = True)
            while True:
                # получение пути к zsh
                zsh_path = shutil.which("zsh")
                if not zsh_path:
                    print(f"{Cols.WARN}Повторяем установку zsh..{Cols.END}")
                    subprocess.run(["pacman", "-S", "--noconfirm", "zsh"], check = True)
                else:
                    subprocess.run(["chsh", "-s", zsh_path], check = True)
                    print(f"{Cols.INFO}Оболочка изменена успешно!{Cols.END}")
                    break
        
            # установка oh-my-zsh
            home_dir = str(Path.home())
            zsh_custom = os.environ.get("ZSH_CUSTOM", f"{home_dir}/.oh-my-zsh/custom")
            os.makedirs(zsh_custom, exist_ok = True)

            # скачать и проверить скрипт перед выполнением
            subprocess.run(["curl", "-fsSL", "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh", 
                "-o", "/tmp/install_ohmyzsh.sh"], check = True)
            subprocess.run(["sh", "/tmp/install_ohmyzsh.sh", "--unattended"], check = True)

            # клонирование репозиториев
            repos = [
                ("https://github.com/romkatv/powerlevel10k.git", f"{zsh_custom}/themes/powerlevel10k"),
                ("https://github.com/zsh-users/zsh-syntax-highlighting.git", f"{zsh_custom}/plugins/zsh-syntax-highlighting"),
                ("https://github.com/zsh-users/zsh-autosuggestions", f"{zsh_custom}/plugins/zsh-autosuggestions")
            ]

            for repo_url, target_dir in repos:
                os.makedirs(os.path.dirname(target_dir), exist_ok = True)
                subprocess.run(["git", "clone", "--depth=1", repo_url, target_dir], check = True)

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка выполнения команды: {e}{Cols.END}")
        
        except Exception as e:
            print(f"{Cols.ERROR}Неожиданная ошибка: {e}{Cols.END}") 

    elif user_input == "N":
        return

    else:
        print(f"{Cols.WARN}Неверный ввод. Пропуск смены shell.{Cols.END}")




def change_cursors():
    user_input = input("Сменить тему курсоров? [Y/n] ").strip().upper()
    if user_input == "Y" or user_input == "":
        colors = [ "rosewater", "flamingo", "pink", "mauve", "red", "maroon", "peach", "yellow", "green", "teal", "sky", "sapphire", "blue", "lavender", "dark", "light" ]
    
        print("Доступные цвета курсоров:")
        for color in colors:
            print(f"- {color}\n")

        while True:
            theme_color = input("\nВыберите цвет темы курсоров: ").strip().lower() 
            if theme_color not in colors:
                print(f"{Cols.WARN}Ошибка: цвет {theme_color} не поддерживается!{Cols.END}")
            else:
                break

        try:
            # установка курсоров
            subprocess.run(["yay", "-S", "--noconfirm", "catppuccin-cursors-mocha"])
        
            # изменение курсоров
            with open(os.path.expanduser("~/.Xresources"), "a") as f:
                f.write(f"Xcursor.theme: catppuccin-mocha-{theme_color}-cursors\n")
        
            print(f"{Cols.INFO}Курсоры изменены успешно!{Cols.END}")
            return True
        
        except Exception as e:
            print(f"{Cols.ERROR}Ошибка при изменении курсоров: {e}{Cols.END}")
            return False




def setup_dots():
    repo_url = "https://github.com/whyhilde/dot-files"
    home_dir = Path.home()
    config_dir = home_dir / ".config"
    config_backup = home_dir / "config_copy"
    
    # Создаем временную директорию для клонирования
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        
        try:
            # клонируем репозиторий
            print(f"Клонируем репозиторий {repo_url}...")
            result = subprocess.run(
                ["git", "clone", repo_url, temp_path],
                capture_output = True,
                text = True,
                check = True
            )
            print(f"{Cols.INFO}Репозиторий успешно скопирован!{Cols.END}")
            
            repo_config = temp_path / ".config"
            if repo_config.exists():
                # создаем backup текущего .config если он существует
                if config_dir.exists():
                    print("Создание копии текущего .config...")
                    if config_backup.exists():
                        shutil.rmtree(config_backup)
                    shutil.copytree(config_dir, config_backup)
                    print(f"{Cols.INFO}Backup создан в {config_backup}{Cols.END}")
                
                    # удаляем оригинальный .config
                    print("Удаляем текущий .config...")
                    shutil.rmtree(config_dir)
            
                # копируем .config из репозитория
                print("Копирование .config из репозитория...")
                shutil.copytree(repo_config, config_dir)
                print(f"{Cols.INFO}Конфиги успешно обновлены!{Cols.END}")
            else:
                print(f"{Cols.WARN}Директория с конфигами не найдена в репозитории.{Cols.END}")

            # копируем указанные файлы из корня репозитория
            files_to_copy = [ ".zshrc", ".p10k.zsh", ".tmux.conf", "git/.gitconfig" ]
            print("Копирование остальных конфигов...")
                
            for file_name in files_to_copy:
                source_file = temp_path / file_name
                dest_file = home_dir / Path(file_name).name
                    
                if source_file.exists():
                    # создаем backup если файл уже существует
                    if dest_file.exists():
                        backup_file = home_dir / f"{file_name}_copy"
                        shutil.copy2(dest_file, backup_file)
                        print(f"{Cols.HINT}Создана копия: {backup_file}{Cols.END}")
                        
                    # копируем файл
                    shutil.copy2(source_file, dest_file)
                    print(f"{Cols.INFO}{file_name} успешно обновлен!{Cols.END}")
                else:
                    print(f"{Cols.WARN}Файл {file_name} не найден в репозитории.{Cols.END}")
            
            print(f"{Cols.INFO}Все конфиги успешно обновленны!{Cols.END}")

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка при клонировании репозитория: {e}{Cols.END}")
            print(f"Stderr: {e.stderr}")
            raise

        except Exception as e:
            print(f"{Cols.ERROR}Произошла ошибка: {e}{Cols.END}")
            raise




def setup_sddm():
    # проверяем установлен ли SDDM
    result = subprocess.run(["pacman", "-Q", "sddm"], capture_output = True, text = True)
    
    if result.returncode != 0:
        print("Переустановка SDDM...")
        install = subprocess.run(["pacman", "-S", "--noconfirm", "sddm"])
        if install.returncode != 0:
            print(f"{Cols.ERROR}Установка sddm не удалась.{Cols.END}")
            return False
        elif install.returncode == 0:
            print(f"{Cols.INFO}SDDM успешно установлен!{Cols.END}")
    
    # активируем SDDM
    try:
        subprocess.run(["systemctl", "enable", "sddm.service"])
        subprocess.run(["systemctl", "start", "sddm.service"])
        print(f"{Cols.INFO}SDDM настроен успешно!{Cols.END}")

    except subprocess.CalledProcessError as e:
        print(f"{Cols.ERROR}Ошибка в активации SDDM: {e}{Cols.END}")




def main():
    if os.geteuid() != 0:
        print(f"{Cols.ERROR}Ошибка: скрипт требует прав суперпользователя!")
        print(f"{Cols.ERROR}Используйте: sudo python {sys.argv[0]}{Cols.END}")
        sys.exit(1)

    try:
        print(banner)
        menu = int(input("1: УСТАНОВКА | 2: ВЫХОД "))
        if menu == 1:
            if update_repositories() == True:

                if install_yay() == True:

                    install_fonts()

                    change_shell()
                
                    change_cursors()

                    setup_dots()

                    setup_sddm()

                print(f"{Cols.INFO}Installation is complete!{Cols.END}")

        elif menu == 2:
            sys.exit()

        else:
            print(f"{Cols.WARN}Введенно неверное число!{Cols.END}")
            sys.exit()

    except ValueError:
        print(f"{Cols.WARN}Введён неверный символ!{Cols.END}")
        sys.exit(1)

    except KeyboardInterrupt:
        sys.exit(1)


if __name__ == "__main__":
    main()
