require 'yaml'
require 'commander'
require 'habitica_client'

module Hab
  require 'hab/version'
  require 'hab/config'
  require 'hab/filter'
  require 'hab/formatter'

  def self.config
    @@config ||= Config.new
  end

  def self.client
    @@client ||= HabiticaClient.new(config.user_id, config.api_token)
  end

  def self.status
    Formatter.status(client.user)
  end

  def self.stats
    Formatter.stats(client.user.stats)
  end

  def self.add_task(task, type)
    client.user.tasks.create({
      text: task,
      type: type
    })
  end

  def self.add_tasks(tasks, type)
    tasks.each do |task|
      self.add_task(task, type)
    end
  end

  def self.stdin_tasks
    !STDIN.tty? ?  STDIN.read.split("\n") : []
  end

  def self.habits(options)
    Formatter.tasks(client.user.tasks.habits, emoji: options.emoji)
  end


  def self.dailies(options)
    tasks = Filter.by_status(client.user.tasks.dailies,
                             options)

    Formatter.tasks(tasks, emoji: options.emoji)
  end

  def self.todos(options)
    tasks = Filter.by_status(client.user.tasks.todos,
                             options)

    Formatter.tasks(tasks, emoji: options.emoji)
  end

end
