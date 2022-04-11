"""Check if packages in Aptfile exists using python3-apt local cache"""
import sys

import apt_pkg


apt_pkg.init_config()
apt_pkg.init_system()
cache = apt_pkg.Cache()

apt_file = sys.argv[1]

with open(apt_file, encoding='utf-8', mode='r') as aptfile:

    content = aptfile.readlines()

    for line in content:
        if line is None or line == "\n" or line.startswith("#"):
            continue

        package_name = line.strip()

        if package_name in cache:
            print("CACHED", package_name)
        else:
            print("ERROR", package_name)
