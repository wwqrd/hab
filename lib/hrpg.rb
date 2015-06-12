require "hrpg/version"
require "dotenv"
require "habit_client"
require "rumoji"
require "rumoji/erase"
require "colorize"
require "commander"

Dotenv.load

class HRPG
  include Commander::Methods

  def user_id
    ENV['USER_ID']
  end

  def api_token
    ENV['API_TOKEN']
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
    program :description, 'A command line interface for HabitRPG: Your Life the Role Playing Game.'

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
