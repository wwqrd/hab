require "yaml"
require "commander"
require "habit_client"

class HRPG
  require "hrpg/version"
  require "hrpg/config"
  require "hrpg/filter"
  require "hrpg/formatter"

  include Commander::Methods
  include Config

  def client
    @client ||= HabitClient.new(user_id, api_token)
  end

  def run
    program :version, '0.0.1'
    program :description, "A command line interface for HabitRPG: Your Life the Role Playing Game.\n\n" \
      "To use you need to set up a config file with your settings:\n\n" \
      "  # in ~/.hrpg\n" \
      "  user_id: YOUR_HABITRPG_USER_ID\n" \
      "  api_token: YOUR_HABITRPG_API_TOKEN\n\n" \
      "More info at: https://github.com/steeeve/hrpg"

    command :status do |c|
      c.syntax = 'habitrpg status [options]'
      c.summary = 'Show my status overview'
      c.action do |args, options|
        puts Formatter.status(client.user)
      end
    end

    command :stats do |c|
      c.syntax = 'habitrpg stats [options]'
      c.summary = 'Show all my stats'
      c.action do |args, options|
        stats = client.user.stats
        puts "HP #{stats.hp}"
        puts "MAX_HP #{stats.maxHealth}"
        puts "MP #{stats.mp}"
        puts "MAX_MP #{stats.maxMP}"
        puts "EXP #{stats.exp}"
        puts "TO_NEXT_LEVEL #{stats.toNextLevel}"
        puts "PER #{stats.per}"
        puts "INT #{stats.int}"
        puts "CON #{stats.con}"
        puts "STR #{stats.str}"
        puts "LVL #{stats.lvl}"
        puts "GP #{stats.gp}"
      end
    end

    command :habits do |c|
      c.syntax = 'habitrpg habits [options]'
      c.summary = 'Show my habit list'
      c.action do |args, options|
        puts Formatter.tasks(client.user.tasks.habits)
      end
    end

    command :dailies do |c|
      c.syntax = 'habitrpg dailies [options]'
      c.summary = 'Show my dailies list'
      c.option '--completed', 'Only show completed'
      c.option '--uncompleted', 'Only show uncompleted'
      c.action do |args, options|
        options.default :completed => false, :uncompleted => false

        tasks = Filter.by_status(client.user.tasks.dailies,
                                 options.completed,
                                 options.uncompleted)

        puts Formatter.tasks(tasks)
      end
    end

    command :todos do |c|
      c.syntax = 'habitrpg todos [options]'
      c.summary = 'Show my todos list'
      c.option '--completed', 'Only show completed'
      c.option '--uncompleted', 'Only show uncompleted'
      c.action do |args, options|
        options.default :completed => false, :uncompleted => false

        tasks = Filter.by_status(client.user.tasks.todos,
                                 options.completed,
                                 options.uncompleted)

        puts Formatter.tasks(tasks)
      end
    end

    run!
  end

end
