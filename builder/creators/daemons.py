from options import Cols


import subprocess


class Daemons:
    @staticmethod
    def enable_all_daemons():
        Daemons.enable_network()
        Daemons.enable_bluetooth()

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
