require 'yaml'
require 'commander'
require 'habit_client'

module HRPG
  require 'hrpg/version'
  require 'hrpg/config'
  require 'hrpg/filter'
  require 'hrpg/formatter'

  def self.config
    @@config ||= Config.new
  end

  def self.client
    @@client ||= HabitClient.new(config.user_id, config.api_token)
  end

  def self.status
    Formatter.status(client.user)
  end

  def self.stats
    Formatter.stats(client.user.stats)
  end

  def self.habits(options)
    Formatter.tasks(client.user.tasks.habits, emoji: options.emoji)
  end

  def self.dailies(options)
    tasks = Filter.by_status(client.user.tasks.dailies,
                             options.completed,
                             options.uncompleted)

    Formatter.tasks(tasks, emoji: options.emoji)
  end

  def self.todos(options)
    tasks = Filter.by_status(client.user.tasks.todos,
                             options.completed,
                             options.uncompleted)

    Formatter.tasks(tasks, emoji: options.emoji)
  end

end
