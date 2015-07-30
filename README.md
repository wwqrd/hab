# Hab

Another command line interface for Habitica: Your Life the Role Playing Game.

Mostly intended to play nice with other unixy programs i.e.

```sh
$ hab stats | grep HP
# HP 47
# MAX_HP 50

$ hab todos
# Feed the fish
# Sort mail

$ echo "Remember the milk" | hab todos
# Remember the milk
# Feed the fish
# Sort mail
```

## Installation

Install it with:

    $ gem install hab

## Usage

To use you need to set up a config file with your settings:

```yaml
# in ~/.habitica
user_id: YOUR_HABITICA_USER_ID
api_token: YOUR_HABITICA_API_TOKEN
```

### Commands

Once your config is set up the following commands should work.

Show your current status (pretty formatted):
```sh
$ hab status
```

![hab status screenshot](https://dl.dropboxusercontent.com/u/443279/hrpg_status.png)

Show your full stats:
```sh
$ hab stats
# HP 47.1
# MAX_HP 50
# MP 44
# MAX_MP 44
# EXP 117
# TO_NEXT_LEVEL 220
# PER 0
# INT 0
# CON 0
# STR 0
# LVL 7
# GP 11.48107934389596
```

List your habits:
```sh
$ hab habits
# Study
# Turn out the lights
```

List your dailies:
```sh
$ hab dailies
# Feed the fish
# Sort mail

$ hab dailies --completed
# Feed the fish

$ hab dailies --uncompleted
# Sort mail
```

List your todos:
```sh
$ hab todos
# Remember the milk
# Put the bins out

$ hab todos --completed
# Remember the milk

$ hab todos --uncompleted
# Put the bins out
```

Add tasks by using STDIN:
```sh
echo "Remember the milk" | hab todos
```

For more information:
```sh
$ hab help
```
