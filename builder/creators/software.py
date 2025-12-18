import packages
from options import Cols


import subprocess
import sys


class Software:
    # @staticmethod
    # def install_fonts():
    #     try:
    #         pass
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
    # except subprocess.CalledProcessError as e:
    #     print(f"{Cols.ERROR}Ошибка при установке шрифтов: {e}{Cols.END}")
    #     return False
    #
    # except Exception as e:
    #     print(f"{Cols.ERROR}Неожиданная ошибка: {e}{Cols.END}")
    #     return False

    @staticmethod
    def install_packages(command: list[str], packages: list[str]):
        try:
            subprocess.run(command + packages, check=True)
            print(
                f"{Cols.INFO}[+] Packages have been successfully installed.{Cols.END}"
            )

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error when installing packages: {e}{Cols.END}")
            sys.exit(1)

        except Exception as e:
            print(f"{Cols.ERROR}[-] Unexpected error: {e}{Cols.END}")
            sys.exit(1)

    @staticmethod
    def install_all_packages():
        print(":: Installing drivers for Intel...")
        Software.install_packages(packages.DEFAULT_CMD, packages.INTEL_PACKAGES)

        print(":: Installing base packages...")
        Software.install_packages(packages.DEFAULT_CMD, packages.BASE_PACKAGES)

        print(":: Installing packages from AUR...")
        Software.install_packages(packages.AUR_CMD, packages.AUR_PACKAGES)
