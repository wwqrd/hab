module HRPG::Filter

  def self.by_status(tasks, options)
    if options.all
      tasks
    elsif options.completed
      self.completed(tasks)
    else
      self.uncompleted(tasks)
    end
  end

  def self.completed(tasks)
    tasks.select(&:completed?)
  end

  def self.uncompleted(tasks)
    tasks.select { |task| !task.completed? }
  end

end
