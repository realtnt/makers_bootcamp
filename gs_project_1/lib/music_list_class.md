# todo_list_class Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class MusicList
  def initialize
   #initialize empty array
  end 

  def add(track)
  # track is a string, returns nothing, throws exception if track is not valid
  end

  def showTracks
  # return array
  end
end 
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
list = MusicList.new
list.add("Happy")
list.showTracks => ["Happy"]

#2
list = MusicList.new
list.add(nil) => throws error invalid track #or anything other than a string
list.showTracks => []

#3
list = MusicList.new
list.add("Happy")
list.add("Something")
list.add("Merry Merry")
list.add("Hey Jude")
list.showTracks => ["Happy", "Something", "Merry Merry", "Hey Jude"]


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
