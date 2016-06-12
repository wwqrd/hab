module Hab
  module Filter

    def self.by_status(tasks, options)
      if options.all
        tasks
      elsif options.completed
        completed(tasks)
      else
        uncompleted(tasks)
      end
    end

    def self.completed(tasks)
      tasks.select(&:completed?)
    end

    def self.uncompleted(tasks)
      tasks.select { |task| !task.completed? }
    end

  end

end
