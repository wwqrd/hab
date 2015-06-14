require "yaml"
require "rumoji"
require "colorize"
require "commander"
require "rumoji/erase"
require "hrpg/version"
require "habit_client"

class HRPG
  include Commander::Methods

  def config
    @config ||= YAML::load_file "#{Dir.home}/.hrpg"
  end

  def user_id
    config["user_id"]
  end

  def api_token
    config["api_token"]
  end

  def client
    @client ||= HabitClient.new(user_id, api_token)
  end

  def print_tasks(tasks)
    tasks.each do |task|
      task_text = Rumoji.erase(task.text).gsub(/\ \ /, " ").strip
      puts "#{task_text}"
    end
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
        stats = client.user.stats
        puts "HP #{stats.hp}/#{stats.maxHealth}"
        puts "MP #{stats.mp}/#{stats.maxMP}"
        puts "EXP #{stats.exp}/#{stats.toNextLevel}"
      end
    end

    command :habits do |c|
      c.syntax = 'habitrpg habits [options]'
      c.summary = 'Show my habit list'
      c.action do |args, options|
        print_tasks(client.user.tasks.habits)
      end
    end

    command :dailys do |c|
      c.syntax = 'habitrpg dailys [options]'
      c.summary = 'Show my dailys list'
      c.action do |args, options|
        print_tasks(client.user.tasks.dailys)
      end
    end

    command :todos do |c|
      c.syntax = 'habitrpg todos [options]'
      c.summary = 'Show my todos list'
      c.action do |args, options|
        print_tasks(client.user.tasks.todos)
      end
    end

    run!
  end
end
