"""Check if packages in Brewfile exists using Homebrew API"""
import sys

import requests

BASE_URL = "https://formulae.brew.sh/api/{}/{}.json"
GH_RAW_URL = "https://raw.githubusercontent.com/{}/homebrew-{}/master/{}/{}.rb"
IGNORE_PACKAGES = []

brew_file = sys.argv[1]

with open(brew_file, encoding='utf-8', mode='r') as brewfile:
    content = brewfile.readlines()

    for line in content:

        if line is None or line == "\n" or line.startswith("#"):
            continue

        line_parsed = line.strip()
        name = line_parsed[6:-1]

        if name in IGNORE_PACKAGES:
            print('SKIP', name)
            continue

        name_parts = name.split('/')
        if len(name_parts) == 3:

            if line_parsed.startswith("brew"):
                BREW_TYPE = "Formula"
            else:
                BREW_TYPE = "Casks"

            RAW_URL_PARSED = GH_RAW_URL.format(name_parts[0], name_parts[1],
                                               BREW_TYPE, name_parts[2])

            brew_req = requests.get(RAW_URL_PARSED)
            if line_parsed.startswith("brew"):
                BREW_TYPE = "Formula"
            else:
                BREW_TYPE = "Casks"

            brew_req = requests.get(RAW_URL_PARSED)
            print('TAP', name, brew_req.status_code)
            continue

        if line_parsed.startswith("brew "):
            brew_req = requests.get(BASE_URL.format('formula', name))
            print('BREW', name, brew_req.status_code)
            continue

        if line_parsed.startswith("cask "):
            brew_req = requests.get(BASE_URL.format('cask', name))
            print('CASK', name, brew_req.status_code)
            continue
