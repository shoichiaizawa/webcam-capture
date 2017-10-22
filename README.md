webcam-capture
==============

📷 A simple webcam capture Bash script to take pictures of you at regular intervals, works both on macOS and Ubuntu/Debian 📸

Installation
------------

### Prerequisites

Currently, macOS and Ubuntu/Debian are supported.

- OS: macOS, Ubuntu, Debian
- A command line tool to control the webcam of your device:
    - [imagesnap](https://github.com/rharder/imagesnap) for macOS
    - [fswebcam](https://github.com/fsphil/fswebcam) for Ubuntu/Debian

#### macOS

The macOS version depends on [`imagesnap`](https://github.com/rharder/imagesnap) package.

To install the package via Homebrew, run:

```sh
brew install imagesnap
```

#### Ubuntu/Debian

The Ubuntu/Debian version depends on [`fswebcam`](https://github.com/fsphil/fswebcam) package.

To install the package via apt-tools, run:

```sh
sudo apt-get install -y fswebcam
```

#### Windows

¯\\\_(ツ)\_/¯

Help me find a way for this to work on Windows machines 🙏

### Clone this repository

Move to a directory of your choice and clone this repository in there:

```sh
cd your/prefered/working-directory/
git clone https://github.com/shoichiaizawa/webcam-capture.git
```

Usage
-----

### Schedule your cron job

Once everything is installed, we use the `crontab` command to schedule a photo snapping at regular intervals.

To edit your crontab, run:

```sh
env SHELL=nano crontab -e
```

And define how often you wish to take pictures. If you wish to take pictures at 1 minute intervals, set the following:

```sh
* * * * * $HOME/path/to/webcam-capture/webcam-capture.sh > /dev/null 2>&1
```

Note: Here you can find [crontab format](http://www.nncron.ru/help/EN/working/cron-format.htm); set your preferred time interval.

🎉 Congratulations 🎉

By now, you should be able to take pictures of you every 1 minute. By default, all the captured pictures are to be saved in the `~/Pictures/webcam-capture/` directory.

If not working properly, please open an [issue](https://github.com/shoichiaizawa/webcam-capture/issues/new) for discussion.

### Remove your cron job

If you wish to remove your crontab, run:

```sh
crontab -d
```

Contributing
------------

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

Acknowledgements
----------------

`webcam-capture` is based upon the following projects:

- [imagesnap](https://github.com/rharder/imagesnap)
- [fswebcam](https://github.com/fsphil/fswebcam)

Special thanks to [Takao Hashimoto](https://github.com/HashimotoTakao), who gave
me inspiration and the boilerplate code for this project.

License
-------

TODO: Write license
