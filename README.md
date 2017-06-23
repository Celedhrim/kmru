# Kmru

This gem install a command `kmru`, it's not a gem you can use in your software.

The goal is simple: Fix note and votes in kodi database from IMDB

## Installation

    $ gem install kmru

Then first launch will create the configuration file in ~/.config/kmru.conf

## Configuration

Edit  **~/.config/kmru.conf**

* *host* = kodi host
* *port* = kodi api port
* *user* = kodi api user
* *pass* = kodi api pass
* *number* = default number of movie in cron / random / last mode


## Usage

```
Usage: kmru [options]
    -m, --mode MODE                  Choose which mode to use
                                       - last   : proceed most recent movies ( default)
                                       - random : Take N random movies
                                       - cron   : like random but with minimal output
                                       - all    : procees the entire library
    -n, --number NUM                 Check NUM movies
    -v, --verbose                    Verbose output (show nochange movies too)
    -h, --help                       Displays Help

Host options (you should use config file) :

    -H, --host HOST                  Kodi instance address
    -P, --port                       Kodi instance port
    -u, --user USERNAME              Kodi instance auth user
    -p, --pass PASSWORD              Kodi instance auth password
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Celedhrim/kmru.
