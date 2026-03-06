from options import Cols


from pathlib import Path
import subprocess
import sys


class Dotfiles:
    @staticmethod
    def setup_all_dotfiles():
        Dotfiles.setup_configs()
        Dotfiles.setup_git()
        Dotfiles.setup_browser()

    @staticmethod
    def setup_configs():
        try:
            home_dir = Path.home()
            repo_dir = Path(__file__).resolve().parents[2]
            user_config = home_dir / ".config"
            backup_config = home_dir / ".config_copy"
            repo_config = repo_dir / ".config"

            print(":: Updating configurations...")

            if user_config.exists():
                if backup_config.exists():
                    subprocess.run(["rm", "-rf", backup_config], check=True)
                subprocess.run(["mv", user_config, backup_config], check=True)
                print(f"{Cols.HINT}[!] Backup created: {backup_config}.{Cols.END}")

            subprocess.run(["cp", "-r", repo_config, user_config], check=True)

            print(
                f"{Cols.INFO}[+] Configurations have been successfully updated.{Cols.END}"
            )

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

        except Exception as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

    @staticmethod
    def setup_git():
        try:
            print(":: Configuring Git...")

            home_dir = Path.home()
            repo_dir = Path(__file__).resolve().parents[2]
            source_file = repo_dir / "home" / ".gitconfig"
            dest_file = home_dir / ".gitconfig"
            backup_file = home_dir / ".gitconfig_copy"

            if dest_file.exists():
                if backup_file.exists():
                    subprocess.run(["rm", backup_file], check=True)
                subprocess.run(["mv", dest_file, backup_file], check=True)
                print(f"{Cols.HINT}[!] Backup created: {backup_file}.{Cols.END}")

            subprocess.run(["cp", source_file, dest_file], check=True)

            print(f"{Cols.INFO}[+] Git has been successfully configured.{Cols.END}")

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Command execution error: {e}.{Cols.END}")
            sys.exit(1)

        except Exception as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

    @staticmethod
    def setup_browser():
        try:
            print(":: Configuring Zen Browser...")

            repo_dir = Path(__file__).resolve().parents[2]

            subprocess.run(
                ["cp", f"{repo_dir}/browser/user.js", "~/.zen/*(release)/user.js"],
                check=True,
            )
            subprocess.run(
                [
                    "cp",
                    "-r",
                    f"{repo_dir}/browser/chrome/",
                    "~/.zen/*(release)/chrome/",
                ],
                check=True,
            )

            print(
                f"{Cols.INFO}[+] Zen Browser has been successfully configured.{Cols.END}"
            )

        except subprocess.CalledProcessError as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)

        except Exception as e:
            print(f"{Cols.ERROR}[-] Error: {e}.{Cols.END}")
            sys.exit(1)
