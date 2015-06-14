# HRPG

A command line interface for HabitRPG: Your Life the Role Playing Game.

## Installation

Install it with:

    $ gem install hrpg

## Usage

To use you need to set up a config file with your settings:

```yaml
# in ~/.hrpg
user_id: YOUR_HABITRPG_USER_ID
api_token: YOUR_HABITRPG_API_TOKEN
```

Once that's setup the following commands should work:

```sh
# Show your HP/MP stats
$ hrpg status

# List your habits
$ hrpg habits

# List your dailys
$ hrpg dailys

# List your todos
$ hrpg todos

# For more information
$ hrpg help
```
