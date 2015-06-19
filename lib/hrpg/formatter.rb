require 'rumoji'
require 'rumoji/erase'

module HRPG::Formatter

  require 'hrpg/formatter/colors'
  require 'hrpg/formatter/graph'

  module ClassMethods

    def status(user)
      stats = user.stats
      dailies = user.tasks.dailies
      todos = user.tasks.todos
      dailies_complete_count = dailies.count(&:completed?)
      todos_complete_count = todos.count(&:completed?)
      <<-BLOCK
#{statbar(:HP, stats.hp, stats.maxHealth)}
#{statbar(:EXP, stats.exp, stats.toNextLevel)}
#{statbar(:MP, stats.mp, stats.maxMP)}
#{statbar(:DAILIES, dailies_complete_count, dailies.count)}
#{statbar(:TODOS, todos_complete_count, todos.count)}
BLOCK
    end

    def stats(stats)
      <<-BLOCK
HP #{stats.hp}
MAX_HP #{stats.max_health}
MP #{stats.mp}
MAX_MP #{stats.max_mp}
EXP #{stats.exp}
TO_NEXT_LEVEL #{stats.to_next_level}
PER #{stats.per}
INT #{stats.int}
CON #{stats.con}
STR #{stats.str}
LVL #{stats.lvl}
GP #{stats.gp}
BLOCK
    end

    def tasks(tasks, options = {})
      tasks.map { |task| task(task, options) }.join("\n")
    end

    def task(task, options = {})
      if options[:emoji] == true
        Rumoji
          .decode(task.text)
          .colorize(value_color(task.value))
      else
        Rumoji
          .erase(task.text)
          .gsub(/\ \ /, ' ')
          .strip
          .colorize(value_color(task.value))
      end
    end

  end

  extend Colors
  extend Graph
  extend ClassMethods

end
