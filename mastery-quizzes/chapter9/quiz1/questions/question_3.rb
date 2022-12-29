# Write a ToDo list program
# Start by running the tests
# Let the test failures guide you towards the solution
# You'll need to define three methods
# - print_todos, which prints the todos to the screen, one on each line
# - add_todo, which adds a todo to the list
# - remove_todo, which removes a todo from the list

# this is your empty todo list

def print_todos(list)
  puts list
end

def add_todo(list, item)
  list << item
end

def remove_todo(list, item)
  list.delete(item) 
end