# Write a program that acts like a magic 8 ball.  It should:
# * Randomly choose one of five predictions:
#   * `It is certain`
#   * `It is decidedly so`
#   * `Ask again later`
#   * `Outlook not so good`
#   * `Very doubtful`
# * `puts` the prediction it chose.

rnd = rand(5)

case rnd
when 0
  puts "It is certain"
when 1
  puts "It is decidedly so"
when 2
  puts "Ask again later"
when 3
  puts "Outlook not so good"
when 4
  puts "Very doubtful"
end

# * Example output from running the program several times:
#   $ ruby question_1.rb
#   Ask again later
#   $ ruby question_1.rb
#   Ask again later
#   $ ruby question_1.rb
#   It is certain

# WARNING: Watch out for typos!
# For the tests to pass the output must be EXACTLY what is expected.
