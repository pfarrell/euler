require './poker'

File.readlines(ARGV[0]).each do |line|
  g = Game.new
  g.deal(line)
  puts g.winner
end
