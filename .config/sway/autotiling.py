#!/usr/bin/env python

"""
This script uses the i3ipc python module to switch the layout splith / splitv
for the currently focused window, depending on its dimensions.
It works on both sway and i3 window managers.
Inspired by https://github.com/olemartinorg/i3-alternating-layout
Copyright: 2019-2021 Piotr Miller & Contributors
Project: https://github.com/nwg-piotr/autotiling
License: GPL3
Dependencies: python-i3ipc>=2.0.1 (i3ipc-python)
"""

import sys
from functools import partial

from i3ipc import Connection, Event

def switch_splitting(i3, e):
    try:
        con = i3.get_tree().find_focused()
        if con:
            if con.floating:
                # We're on i3: on sway it would be None
                # May be 'auto_on' or 'user_on'
                is_floating = "_on" in con.floating
            else:
                # We are on sway
                is_floating = con.type == "floating_con"

            # Exclude floating containers, stacked layouts, tabbed layouts and full screen mode
            if not is_floating and con.fullscreen_mode != 1 and con.parent.layout not in ["stacked", "tabbed"]:
                new_layout = "splitv" if con.rect.height > con.rect.width else "splith"

                if new_layout != con.parent.layout:
                    i3.command(new_layout)

    except Exception as e:
        print("Error: %s" % e, file=sys.stderr)


def main():
    handler = partial(switch_splitting)
    i3 = Connection()
    for e in ["WINDOW", "MODE"]:
        try:
            i3.on(Event[e], handler)
            print("%s subscribed" % Event[e])
        except KeyError:
            print("'%s' is not a valid event" % e, file=sys.stderr)
    i3.main()


if __name__ == "__main__":
    # execute only if run as a script
    main()
