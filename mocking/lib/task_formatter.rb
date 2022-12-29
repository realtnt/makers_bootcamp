class TaskFormatter
  def initialize(task) # task is an instance of Task
    @title = task.title
    @complete = task.complete?
  end

  def format
    @complete ? "- [x] #{@title}" : "- [ ] #{@title}" 
  end
end