# Write a program that keeps a list of todos.
# The imlementation will be quite different to that of chapter 9.
# This time, you'll be using classes.

# The program should:
# * Have two classes:
#   * `Todo`
#     * Has two methods:
#       * `initialize`: Creates a new todo object. Takes a string as a
#         parameter and stores it on the todo object.
#       * `text`: Takes no parameters. Returns the string that was
#         stored when the todo object was created.
#   * `TodoList`
#     * Has three methods:
#       * `initialize`: Creates a new todo list object. Takes no parameters.
#       * `add`: Takes a todo object as a parameter.  Stores it on the
#         todo list object.
#       * `print`: Takes no parameters.  Creates a string of all the
#         stored todos, one per line.  Each line should start with a
#         `* `.  `puts`es the string.
#         * e.g.
#           ```
#           * get milk
#           * get the papers
#           ```

# * Note: When you run the automated tests, make sure to remove from
#   the top level of the file any calls to any methods.

class Todo
  def initialize(text)
    @todo_text = text
  end

  def text
    @todo_text
  end
end

class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo_item)
    @todo_list << todo_item
  end

  def print
    @todo_list.each { |item| puts "* #{item.text}" }
  end
end
