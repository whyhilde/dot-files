import os
import sys
import subprocess
import shutil


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
version: 1.0 // github: https://github.com/whyhilde
{Cols.END}"""


SOFTWARE = [ "qtile", "rofi", "sddm", "dunst", "git", "firefox", "telegram-desktop", "obsidian", "bitwarden", "blender", "inkscape", "thunderbird", "neovim", "micro", "obs-studio", "libreoffice-fresh", "libreoffice-fresh-ru", "ghostty", "cmus", "cava", "opendoas" ]
DEV_PACKAGES = [ "tmux", "btop", "bat", "eza", "fzf", "thefuck", "git-delta", "zoxide", "tldr", "ripgrep" ]
BASE_PACKAGES = [ "nautilus", "feh", "pavucontrol", "flameshot", "setxkbmap", "network-manager-applet", "python-iwlib", "gnupg" ]
DRIVERS = [ "nvidia", "nvidia-settings", "nvidia-utils", "intel-ucode", "mesa", "vulkan-intel" ]
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
    if not run_command("sudo pacman -S --needed --noconfirm base-devel git"):
        print("Установка зависимостей...")
        return False
    
    # создаем временную директорию и клонируем yay
    temp_dir = "/tmp/yay-install"
    if not run_command(f"rm -rf {temp_dir} && mkdir -p {temp_dir}"):
        print("Создание временной директории...")
        return False
    
    if not run_command(f"git clone https://aur.archlinux.org/yay.git {temp_dir}"):
        print("Клонирование yay из AUR...")
        return False
    
    # переходим в директорию и собираем пакет
    os.chdir(temp_dir)
    if not run_command("makepkg -si --noconfirm"): 
        print("Сборка yay...")
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
    drivers_input = input("Установить драйвера (Intel & NVIDIA)? [y/n] ").strip().upper()
    if drivers_input == "Y" or drivers_input == "":
        print("Установка драйверов...")
        install_packages(DRIVERS)
    elif drivers_input == "N":
        pass
    else:
        print(f"{Cols.ERROR}Неверный ввод. Пропуск установки драйверов.{Cols.END}")

    print("Установка базовых пакетов:")
    for pack in BASE_PACKAGES():
        print(f"- {pack}")
    install_packages(BASE_PACKAGES)

    print("Установка программ:")
    for program in SOFTWARE():
        print(f"- {program}")
    install_packages(SOFTWARE)

    dev_packages_input = input("Установить пакеты для разработки? [y/n] ")
    if dev_packages_input == "Y" or dev_packages_input == "":
        print("Установка пакетов...")
        install_packages(DEV_PACKAGES)
    elif drivers_input == "N":
        pass
    else:
        print(f"{Cols.ERROR}Неверный ввод. Пропуск установки пакетов.{Cols.END}")




def change_shell():
    try:
        subprocess.run(["pacman", "-S", "--noconfirm", "zsh"], check = True)
        subprocess.run(["sh", "-c", "'$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"], check = True)
        subprocess.run(["git", "clone", "--depth=1", "https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"], check = True)
        subprocess.run(["git", "clone", "https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"], check = True)
        subprocess.run(["git", "clone", "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"], check = True)
    

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
    except subprocess.CalledProcessError as e:
        print(f"{Cols.ERROR}Ошибка выполнения chsh: {e}{Cols.END}")




def change_cursors():
    colors = [ "rosewater", "flamingo", "pink", "mauve", "red", "maroon", 
              "peach", "yellow", "green", "teal", "sky", "sapphire", 
              "blue", "lavender", "dark", "light" ]
    
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
        print(f"{Cols.WARN}Ошибка при изменении курсоров: {e}{Cols.END}")
        return False



    
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

                install_yay()

                if input("Сменить shell на zsh? [y/n] ").strip().upper() == "Y" | "":
                    change_shell()
                
                if input("Сменить тему курсоров? [y/n] ").strip().upper() == "Y" | "":
                    change_cursors()

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
