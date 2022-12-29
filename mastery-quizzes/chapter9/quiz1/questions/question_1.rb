# Two methods have already been defined, but they don't yet do anything useful
# Your first job is to fill in the method bodies and get the tests to pass
#
# Goodbye
# Should always return 'See you soon!' (not puts)
#
# Hello
# Should return (not puts)
# * 'Good morning!' between 09:00 and 12:00
# * 'Good afternoon!' between 12:00 and 16:00
# * 'Hello!' at all other times

def hello
  current_time = Time.now.hour
  if current_time.between?(9, 11)
    return "Good morning!"
  elsif current_time.between?(12, 15)
    return "Good afternoon!"
  else
    return "Hello!"
  end
end

hello

def goodbye
  "See you soon!"
end

# next
# * define a method called `how_are_you` which returns 'How are you?'
# * define a method called `fun` which returns 'learning Ruby is'
# * define a method called `hashes` which returns 'are collections of key*value pairs'
# * define a method called `arrays` which returns 'are a bit like lists'
# * define a method called `control_flow` which returns 'determines the order of execution'

def how_are_you
  "How are you?"
end

def fun
  "learning Ruby is"
end

def hashes
  "are a collection of key-value pairs"
end

def arrays
  "are a bit like lists"
end

def control_flow
  "determines the order of execution"
end