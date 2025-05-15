# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, extension, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# TODO make this cycle
def run_or_raise(app, wm_class):
    def __inner(qtile):
        for window in qtile.windows_map.values():
            if hasattr(window, "cmd_match") and window.cmd_match(
                Match(wm_class=wm_class)
            ):
                qtile.current_screen.set_group(window.group)
                window.focus(False)
                return
        qtile.cmd_spawn(app)

    return __inner


MOD = "mod4"

TERMINAL = "kitty"
MUSIC = "spotify"
BROWSER = "firefox"
READER = "zathura"
CHAT = "discord"
CALENDAR = "firefox --new-window https://calendar.google.com/calendar/u/0/r/week"
SYSTEM_MONITOR = f"{TERMINAL} -e gotop"
AUDIO_CONTROL = f"{TERMINAL} -e pulsemixer"
SCREENSHOT = "flameshot gui"

BLUETOOTH = "blueman-manager"
SETTINGS = f"{TERMINAL} --directory dotfiles"

VOLUME_MUTE = "pulsemixer --toggle-mute"
VOLUME_LOWER = "pulsemixer --change-volume -1"
VOLUME_RAISE = "pulsemixer --change-volume +1"
MIC_MUTE = "amixer set Capture toggle"
BRIGHTNESS_DOWN = "brightnessctl set 5%-"
BRIGHTNESS_UP = "brightnessctl set 5%+"

NORD = {
    0: "#2E3440",
    1: "#3B4252",
    2: "#434C5E",
    3: "#4C566A",
    3: "#616E88",
    4: "#D8DEE9",
    5: "#E5E9F0",
    6: "#ECEFF4",
    7: "#8FBCBB",
    8: "#88C0D0",
    9: "#81A1C1",
    10: "#5E81AC",
    11: "#BF616A",
    12: "#D08770",
    13: "#EBCB8B",
    14: "#A3BE8C",
    15: "#B48EAD",
}

keys = [
    Key([MOD], "f", lazy.window.toggle_floating(), desc="Toggle floating"),
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up"),
    Key([MOD], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Moving out of range in Columns layout will create new column.
    Key(
        [MOD, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [MOD, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([MOD, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([MOD, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [MOD, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([MOD, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([MOD, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([MOD, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([MOD, "shift", "control"], "l", lazy.layout.swap_column_right()),
    Key([MOD], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [MOD, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([MOD], "Return", lazy.spawn(TERMINAL), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([MOD, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([MOD, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([MOD], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key(
        [MOD],
        "space",
        lazy.run_extension(
            extension.DmenuRun(
                background=NORD[0],
                foreground=NORD[15],
                selected_background=NORD[15],
                selected_foreground=NORD[0],
            )
        ),
        desc="Spawn a command using a prompt widget",
    ),
    Key([MOD, "shift"], "b", lazy.hide_show_bar("top"), desc="toggle bar"),
    Key([MOD], "s", lazy.spawn(SCREENSHOT), desc="(s)creenshot"),
    Key([], "XF86AudioMute", lazy.spawn(VOLUME_MUTE)),
    Key([], "XF86AudioLowerVolume", lazy.spawn(VOLUME_LOWER)),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(VOLUME_RAISE)),
    Key([], "XF86AudioMicMute", lazy.spawn(MIC_MUTE)),
    Key([], "XF86MonBrightnessDown", lazy.spawn(BRIGHTNESS_DOWN)),
    Key([], "XF86MonBrightnessUp", lazy.spawn(BRIGHTNESS_UP)),
    Key([], "XF86Bluetooth", lazy.spawn(BLUETOOTH)),
    Key([], "XF86Tools", lazy.spawn(SETTINGS)),
    #Key(XF86WLAN             , lazy.spawn()),
    #Key(XF86Display          , lazy.spawn(DISPLAY)),
    #XF86Favorites

    # run or raise
    # Key([MOD], "b", lazy.function(run_or_raise(BROWSER, BROWSER)), desc="run or raise (b)rowser"),
    # Key([MOD], "m", lazy.function(run_or_raise(MUSIC, MUSIC)), desc="run or raise (m)usic"),
    # Key([MOD], "r", lazy.function(run_or_raise(READER, "pdfopen")), desc="run or raise (m)usic"),
    # Key([MOD], "c", lazy.function(run_or_raise(CHAT, CHAT)), desc="run or raise (c)hat"),
]

groups = [Group(i) for i in "123456789"]
# groups = [Group(name=str(i), layout="max", label=x) for i,x in enumerate(group_icons, start=1)]
# groups = [
#     Group( # workspace
#         name="1",
#     ),
#     Group( # browser
#         name="2",
#     ),
#     Group( # browser
#         name="3",
#     ),
#     Group( # chat
#         name="c",
#         matches=[Match(wm_class=["discord"])],
#         label="",
#     ),
#     Group( # music
#         name="m",
#         matches=[Match(wm_class=["spotify"])],
#         label="",
#     ),
# ]


for group in groups:
    keys.extend(
        [
            # MOD1 + letter of group = switch to group
            Key(
                [MOD],
                group.name,
                lazy.group[group.name].toscreen(),
                desc="Switch to group {}".format(group.name),
            ),
            # MOD1 + shift + letter of group = switch to & move focused window to group
            Key(
                [MOD, "shift"],
                group.name,
                lazy.window.togroup(group.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(group.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # MOD1 + shift + letter of group = move focused window to group
            # Key([MOD, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
layout_defaults = {
    "border_focus": NORD[15],
    "border_normal": NORD[10],
    "border_on_single": False,
    "margin_on_single": 0,
    "margin": 5,
}
layouts = [
    layout.Columns(**layout_defaults),
    # layout.Tile(**layout_defaults),
    # layout.MonadThreeCol(**layout_defaults),
    layout.Max(margin=([50]*4)),
]

widget_defaults = dict(
    font="mono",
    fontsize=18,
    padding=3,
    background=NORD[0],
    foreground=NORD[15],
)
extension_defaults = widget_defaults.copy()

alpha_colors = {
    "foreground": NORD[0],
    "background": NORD[15],
}
beta_colors = {
    "foreground": NORD[0],
    "background": NORD[8],
}

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active=NORD[15],
                    inactive=NORD[10],
                    this_current_screen_border=NORD[15],
                    block_highlight_text_color=NORD[0], # for use with "block"
                    highlight_method="block",
                    #highlight_color=[NORD[0], NORD[0]], # for use with "line"
                    center_aligned=True,
                    #hide_unused=True,
                    rounded=False,
                    # fontsize=22, # needed for nerd font icons
                ),
                widget.TaskList(
                    foreground=NORD[0],
                    border=NORD[15],
                    fontsize=18,
                    unfocused_border=NORD[10],
                    highlight_method="block",
                    max_title_width=300,
                    title_width_method="uniform",
                    icon_size=24,
                    rounded=False,
                ),
                widget.Notify(default_timeout=45),
                widget.Systray(),
                widget.Spacer(length=10),
                #
                widget.Mpris2(
                    max_chars=35,
                    display_metadata=["xesam:title", "xesam:artist"],
                    fmt="🎵 {} |",
                    playing_text="⏵ {track}",
                    paused_text="⏸ {track}",
                    **alpha_colors,
                ),
                widget.PulseVolume(
                    emoji=False,
                    fmt="🔉 {} |",
                    **alpha_colors
                ),
                #widget.Bluetooth(**alpha_colors),
                widget.Backlight(
                    fmt="💡 {} |",
                    change_command="brightnessctl set {0}%",
                    step=5,
                    backlight_name="intel_backlight",
                    brightness_file="brightness",
                    **alpha_colors
                ),
                widget.Memory(
                    format="💾 {MemPercent:02.0f}% |",
                    measure_mem="G",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(SYSTEM_MONITOR)
                    },
                    **alpha_colors,
                ),
                widget.CPU(
                    format=" 🖥️ {load_percent:02.0f}% |",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(SYSTEM_MONITOR)
                    },
                    **alpha_colors,
                ),
                #widget.Wttr(**alpha_colors),
                widget.Battery(
                    format="🔋 {char} {percent:02.0%} |", **alpha_colors,
                    show_short_text=False,
                ), 
                widget.Clock(
                    format="%Y-%m-%d %A %H:%M",
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(CALENDAR)},
                    **alpha_colors,
                ),
                widget.DF(),
            ],
            30,
        ),
        wallpaper="pics/wall.jpg",
        wallpaper_mode="fill",
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [MOD],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_focus=NORD[13],
    border_normal=NORD[14],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# change to LG3D if having issues with Java UI programs
wmname = "Qtile"
