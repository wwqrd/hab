require "rumoji"
require "rumoji/erase"

module HRPG::Formatter

  require "hrpg/formatter/colors"
  require "hrpg/formatter/graph"

  module ClassMethods

    def status(user)
      stats = user.stats
      dailies = user.tasks.dailies
      todos = user.tasks.todos
      dailies_complete_count = dailies.count { |task| task.completed? }
      todos_complete_count = todos.count { |task| task.completed? }
      "#{statbar(:HP, stats.hp, stats.maxHealth)}\n" \
        "#{statbar(:EXP, stats.exp, stats.toNextLevel)}\n" \
        "#{statbar(:MP, stats.mp, stats.maxMP)}\n" \
        "#{statbar(:DAILIES, dailies_complete_count, dailies.count)}\n" \
        "#{statbar(:TODOS, todos_complete_count, todos.count)}\n"
    end

    def tasks(tasks)
      tasks.map { |task| task(task) }.join("\n")
    end

    def task(task)
      Rumoji.erase(task.text).gsub(/\ \ /, " ").strip
    end

  end

  extend Colors
  extend Graph
  extend ClassMethods

end
