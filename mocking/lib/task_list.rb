require 'task_formatter'

class TaskList
  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
  end

  def all
    return @tasks
  end

  def all_complete?
    @tasks.empty? ? false : @tasks.all?(&:complete?)
  end
end
