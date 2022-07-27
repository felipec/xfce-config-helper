This project attempts to simplify the configuration of Xfce, by using YAML files instead of XML
files.

In order to maintain your configuration, you would need an XML file like:

```xml
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-keyboard-shortcuts" version="1.0">
  <property name="xfwm4" type="empty">
    <property name="custom" type="empty">
      <property name="&lt;Primary&gt;&lt;Alt&gt;Down" type="string" value="down_workspace_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Right" type="string" value="right_workspace_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Left" type="string" value="left_workspace_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Up" type="string" value="up_workspace_key"/>
    </property>
  </property>
</channel>
```

Of course, the moment you change any other configuration this file immediately is filled with noise,
and then it becomes hard to keep track what are the defaults, and what are your changes.

Instead, we use a much less verbose YAML file:

```yaml
shorcuts:
  wm:
    left_workspace: "<Super>Left"
    right_workspace: "<Super>Right"
    up_workspace: "<Super>Up"
    down_workspace: "<Super>Down"
```

This format is not only less verbose and more readable, but it also maps conceptually to what a
human wants to do: map `right_workspace` to a key, not a key to `right_workspace_key`.

Additionally, all configurations can be stored in the same file:

```yaml
---
shortcuts:
  commands:
    "<Super>Return": xfce4-terminal
  wm:
    left_workspace: "<Super>Left"
    right_workspace: "<Super>Right"
    up_workspace: "<Super>Up"
    down_workspace: "<Super>Down"
settings:
  xfwm4:
    "/general/easy_click": Super
  xfce4-session:
    "/general/SaveOnExit": false
  xfce4-desktop:
    "/desktop-icons/style": 0
panels:
- position: p=10;x=0;y=0
  plugins:
  - - whiskermenu
  - - tasklist
  - - pager
```

Even the configuration of the panels is understandable, as opposed to the XML one.

To load a configuration:

```yaml
xfconf-load config.yml
```

The configuration is loaded using D-Bus, so it's immediately activated.

To store your current current configuration:

```yaml
xfconf-dump > config.yml
```

Known defaults will be skipped in order to better visualize the actual configuration.

## Prerequisites

To use you will need `ruby` and the `ruby-dbus` gem, which you can install with:

```sh
gem install ruby-dbus
```

## Install

Simply run `make install` (and make sure `~/.local/bin` is in your `$PATH`).

If you are using Arch Linux, you can install xfce-config-helper from AUR.

```sh
yay -Sy xfce-config-helper
```
