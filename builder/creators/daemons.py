from options import Cols


import subprocess
import sys


class Daemons:
    @staticmethod
    def enable_all_daemons():
        Daemons.enable_network()
        Daemons.enable_bluetooth()

    @staticmethod
    def enable_network():
        try:
            print(":: Activating the NetworkManager...")

            subprocess.run(
                ["sudo", "systemctl", "enable", "NetworkManager"], check=True
            )
            subprocess.run(["sudo", "systemctl", "start", "NetworkManager"], check=True)

            print(f"{Cols.INFO}[+] NetworkManager successfully activated.{Cols.END}")

        except subprocess.CalledProcessError as e:
            print(
                f"{Cols.ERROR}[-] Error when activating NetworkManager: {e}{Cols.END}"
            )
            sys.exit(1)

    @staticmethod
    def enable_bluetooth():
        try:
            print(":: Activating the Bluetooth...")

            subprocess.run(
                ["sudo", "systemctl", "enable", "bluetooth.service"], check=True
            )
            subprocess.run(
                ["sudo", "systemctl", "start", "bluetooth.service"], check=True
            )

            print(f"{Cols.INFO}[+] Bluetooth successfully activated.{Cols.END}")

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error when activating Bluetooth: {e}{Cols.END}")
            sys.exit(1)
