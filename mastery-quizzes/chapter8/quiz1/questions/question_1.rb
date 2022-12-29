# Part One
# * define a hash that can be used for traslation
# * there should be four keys and four values
# * the keys should be french words
# * the values should be their english equivalent
# * e.g. 'bonjour' could be the key that is paired with the value 'hello'
# * assign it to a constant called TRANSLATIONS

# Part Two
# * define another hash where the keys are 'dog', 'cat' and 'cow'
# * the values should be 'woof', 'meow' and 'moo'
# * assign it to a constant called ANIMAL_SOUNDS

# Part Three
# * define another hash that describes a person
# * the keys should be 'name', 'age', 'profession', 'favourite_book'
# * the values can be anything you wish
# * assign it to a constant called PERSON

TRANSLATIONS = { 
  'bonjour' => 'hello',
  'au revoir' => 'goodbye',
  'oui' => 'yes',
  'no' => 'no'
}

ANIMAL_SOUNDS = {
  'dog' => 'woof',
  'cat' => 'meow',
  'cow' => 'moo'
}

PERSON = {
  'name' => 'Cedric',
  'age' => 89,
  'profession' => 'Space Explorer',
  'favourite_book' => 'The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life'
}