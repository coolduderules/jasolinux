#!/usr/bin/env python3

"""List packages explicitly installed with pacman or pacaur."""

import re
from collections import namedtuple
from subprocess import check_output

Package = namedtuple("Package", "date name")


def parse_pacman_log():
    installed_packages = set()
    pacman_command_lines = []
    with open("/var/log/pacman.log") as file:
        for line in file:
            line = line.strip()
            if " [PACMAN] Running " in line:
                _, _, _, _, command_line = line.split(maxsplit=4)
                command_line = " {} ".format(command_line.strip("'"))
                pacman_command_lines.append(command_line)
            elif " [ALPM] installed " in line:
                day, hour, _, _, package_name, _ = line.split(maxsplit=5)
                date = f"{day} {hour}"
                package = Package(date, package_name)
                installed_packages.add(package)
    pacman_command_lines = "\n".join(pacman_command_lines)

    currently_installed = set()
    for line in check_output(["pacman", "-Q"]).decode().strip().split("\n"):
        name, _ = line.split()
        currently_installed.add(name)

    explicitly_installed = []
    for pack in installed_packages:
        if pack.name not in currently_installed:
            continue
        name = re.escape(pack.name)
        pack_re = r"([/ ]){}\1".format(name)
        # this picks out packages installed as dependencies by pacaur, systemd hooks etc.
        as_deps_re = r"--asdeps.* {} ".format(name)
        if re.search(pack_re, pacman_command_lines) \
           and not re.search(as_deps_re, pacman_command_lines):
            explicitly_installed.append(pack)
    explicitly_installed.sort(reverse=True)

    already_seen = set()
    explicitly_installed_pruned = []
    for pack in explicitly_installed:
        if pack.name not in already_seen:
            explicitly_installed_pruned.append(pack)
            already_seen.add(pack.name)

    return explicitly_installed_pruned


def main():
    for pack in reversed(parse_pacman_log()):
        print(pack.date, pack.name)


if __name__ == "__main__":
    main()
