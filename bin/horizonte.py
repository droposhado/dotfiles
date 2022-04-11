#!/usr/bin/python3
"""Horizonte is i3bar protocol compatible bar"""

import datetime
import json
import time
from enum import Enum
import uuid

import alsaaudio
import psutil
from psutil._common import bytes2human


DATE_MASK = '%Y-W%V-%u'
TIME_MASK = '%m-%d %H:%M'
WAIT_TIME = 1


class Color(Enum):
    """Colors to use on ObjectBar class"""
    NORMAL_BG = "#2E3440FF"
    NORMAL_FG = "#D8DEE9FF"
    URGENT_BG = "#2E3440"
    URGENT_FG = "#BF616A"


def now_date(date_obj):
    """Convert datetime object to date"""
    return date_obj.strftime(DATE_MASK)


def now_time(time_obj):
    """Convert datetime object to hour"""
    return time_obj.strftime(TIME_MASK)


class ObjectBar():
    """
    Represent objects in bar
    Background is always the same, the variation for alert is the text color
    """

    def __init__(self, full_text, color=Color.NORMAL_FG,
                 separator=False, separator_block_width=0):
        self.color = color
        self.full_text = full_text
        self.separator = separator
        self.separator_block_width = separator_block_width

    def to_json(self):
        """Return attributes in json format"""
        return {
            "background": Color.NORMAL_BG.value,
            "color": self.color.value,
            "full_text": self.full_text,
            "instance": 0,
            "markup": "pango",
            "name": str(uuid.uuid4()),
            "separator": self.separator,
            "separator_block_width": self.separator_block_width
        }

    def to_dump(self):
        """Dump attributes in string format"""
        return json.dumps(self.to_json())


objBarDumper = ObjectBar('<', Color.NORMAL_FG,
                         True, 30).to_dump()


class StatusBar():
    """Represent complete status bar compatible with i3 protocol"""

    def __init__(self):
        self.items = ['[']

    def append(self, item):
        """Add item to internal list"""
        self.items.append(item)
        self.items.append(',')
        self.items.append(objBarDumper)
        self.items.append(',')

    def to_str(self):
        """Create a string compatible with i3 protocol bar"""
        return "".join(self.items[0:-1] + ['],'])


version = {"version": 1, "click_events": False}

print(json.dumps(version))
print('[')

while True:

    cpu_used = psutil.cpu_percent(percpu=True)

    ram_used = bytes2human(psutil.virtual_memory().used)
    ram_total = bytes2human(psutil.virtual_memory().total)

    # network = psutil.net_io_counters()
    # network_receive = bytes2human(network.bytes_recv)
    # network_sent = bytes2human(network.bytes_sent)

    # packet_receive = network.packets_recv
    # packet_sent = network.packets_sent

    volume = int(alsaaudio.Mixer().getvolume()[0])

    battery = psutil.sensors_battery()

    bar = StatusBar()

    cpu_used_str = [str(i) for i in cpu_used]
    bar.append(ObjectBar("  ".join(cpu_used_str)).to_dump())

    bar.append(ObjectBar(f"{ram_used}  {ram_total}").to_dump())

    bar.append(ObjectBar(str(volume)).to_dump())

    # network_sent,
    # network_receive,

    # packet_receive,
    # packet_sent,

    now = datetime.datetime.now()

    bar.append(ObjectBar(now_date(now)).to_dump())

    bar.append(ObjectBar(now_time(now)).to_dump())

    # bar.append(',')
    # bar.append(json.dumps(ObjectBar(
    #    now_time(datetime.datetime.utcnow())).to_json()))

    # if battery not is None:
    #    battery.percent
    #    battery.secsleft
    #    battery.power_plugged
    #    bar.append(',')
    #    bar.append('battery objectbar')

    print(bar.to_str())

    time.sleep(WAIT_TIME)
