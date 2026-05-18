#!/usr/bin/env python3
"""ndate convert UNIX timestamp to iso8601 representation"""

import sys
from datetime import datetime

DATETIME_SAVE_MASK = '%Y-%m-%dT%H:%M:%SZ'

if len(sys.argv) != 2:
    print('')
    print('Please type the UNIX timestamp:')
    print('$ ndate 121201210292')
    sys.exit(1)

number = sys.argv[1]

if not isinstance(number, int):
    number = int(number)

f_tstmp = datetime.fromtimestamp(number)

print(f_tstmp.strftime(DATETIME_SAVE_MASK))
