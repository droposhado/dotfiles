#!/usr/bin/python3
"""Rename one or more files converting names to slug"""

import string
import sys
import os


SCAPES = '/.-'
CHARS = string.ascii_lowercase + string.digits + SCAPES

SPECIAL = {
    '_': '-',

    'á': 'a',
    'à': 'a',
    'â': 'a',
    'ã': 'a',
    'ä': 'a',

    'é': 'e',
    'è': 'e',
    'ê': 'e',
    'ẽ': 'e',
    'ë': 'e',

    'í': 'i',
    'ì': 'i',
    'î': 'i',
    'ĩ': 'i',
    'ï': 'i',

    'ó': 'o',
    'ò': 'o',
    'ô': 'o',
    'õ': 'o',
    'ö': 'o',

    'ú': 'u',
    'ù': 'u',
    'û': 'u',
    'ũ': 'u',
    'ü': 'u',

    'ç': 'c',
    'ḉ': 'c',

    'ń': 'n',
    'ǹ': 'n',
    'ñ': 'n',

    'ś': 's',
    'ŝ': 's'
}

filenames = sys.argv[1:]


def filter_chars(letter):
    """Filter based on string CHARS"""
    return letter if letter in CHARS else ''


def filter_specials(letter):
    """Filter based on dict SPECIAL"""
    return SPECIAL[letter] if letter in SPECIAL else letter


for filename in filenames:

    if not os.path.exists(filename):
        print('ERROR', f"{filename} not found")
        continue

    filename_base = filename.split('/')[-1]

    filter_one = filename_base.lower()
    filter_two = filter_one.replace(' ', '-')

    FILTER_THREE = str()
    for s in filter_two:
        FILTER_THREE += filter_specials(s)

    FILENAME_FIXED = str()
    for c in FILTER_THREE:
        FILENAME_FIXED += filter_chars(c)

    base_path = os.path.dirname(filename)
    new = os.path.join(base_path, FILENAME_FIXED)
    os.rename(filename, new)
