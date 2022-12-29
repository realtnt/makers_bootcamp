players = [
  { :name => "Sam", :sport => "tennis" },
  { :name => "Mary", :sport => "squash" },
  { :name => "Ed", :sport => "tennis" },
  { :name => "Mark", :sport => "football" }
]

sports = Hash.new

players.each do |player|
  sports[player[:sport]] = [] if not sports.key?(player[:sport])
  sports[player[:sport]].push(player[:name])
end

print sports