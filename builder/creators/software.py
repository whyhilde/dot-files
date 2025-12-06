import packages
from options import Cols


import subprocess


class Software:
    @staticmethod
    def install_fonts():
        try:
            pass
            # print(":: Installing fonts...")
            #
            # FONTS = [
            #     "https://github.com/path/to/MesloLGS_NF",
            # ]
            #
            # for font in FONTS:
            #     subprocess.run(["wget", "-O", ])
        
        # try:
        #     print("Установка шрифтов...")
        #     for font in packages.FONTS:
        #         subprocess.run(
        #             ["yay", "-S", "--noconfirm", "--needed", font], check=True
        #         )
        #         print(f"{Cols.INFO}{font} установлен.{Cols.END}")
        #
        #     print("Проверка установленных шрифтов...")
        #     result = subprocess.run(
        #         "fc-list | grep -E '(Meslo|JetBrains)'",
        #         shell=True,
        #         capture_output=True,
        #         text=True,
        #     )
        #     if result.stdout:
        #         print(f"{Cols.HINT}Найдены шрифты:{Cols.END}")
        #         print(result.stdout)
        #         return True
        #     else:
        #         print(f"{Cols.WARN}Шрифты не найдены в системе.{Cols.END}")
        #         return False
        #
        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}Ошибка при установке шрифтов: {e}{Cols.END}")
            return False

        except Exception as e:
            print(f"{Cols.ERROR}Неожиданная ошибка: {e}{Cols.END}")
            return False

    @staticmethod
    def install_packages(command: list[str], packages: list[str]):
        try:
            cmd = command + packages
            subprocess.run(cmd, check=True, capture_output=True, text=True)
            print(
                f"{Cols.INFO}[+] Packages have been successfully installed.{Cols.END}"
            )
            return True

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error when installing packages: {e}{Cols.END}")
            return False

        except Exception as e:
            print(f"{Cols.ERROR}[-] Unexpected error: {e}{Cols.END}")
            return False

    @staticmethod
    def install_all_packages():
        print(":: Installing drivers for Intel...")
        if not Software.install_packages(packages.DEFAULT_CMD, packages.INTEL_PACKAGES):
            return False

        print(":: Installing base packages...")
        if not Software.install_packages(packages.DEFAULT_CMD, packages.BASE_PACKAGES):
            return False

        print(":: Installing packages from AUR...")
        if not Software.install_packages(packages.AUR_CMD, packages.AUR_PACKAGES):
            return False

        return True
