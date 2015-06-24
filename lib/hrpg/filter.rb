module HRPG::Filter

  def self.by_status(tasks, completed, uncompleted)
    if completed && !uncompleted
      self.completed(tasks)
    elsif completed && !uncompleted
      self.uncompleted(tasks)
    else
      tasks
    end
  end

  def self.completed(tasks)
    tasks.select!(&:completed?)
  end

  def self.uncompleted(tasks)
    tasks.select!(&:uncompleted?)
  end

end
