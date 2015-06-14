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
# HP 47.1/50
# MP 44/44
# EXP 117/220

# List your habits

$ hrpg habits
# Study
# Turn out the lights

# List your dailies

$ hrpg dailies
# Feed the fish
# Sort mail

# List your todos

$ hrpg todos
# Remember the milk
# Put the bins out

# For more information

$ hrpg help
```
