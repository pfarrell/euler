require 'byebug'
require './poker'

def test_game(str, winner)
  g = Game.new
  g.deal(str)
  $stderr.puts "error processing #{str}" unless g.winner == winner
end

test_game "8C TS KC 9H 4S 7D 2S 5D 3S AC", :player_two 
test_game "5C AD 5D AC 9C 7C 5H 8D TD KS", :player_one
test_game "3H 7H 6S KC JS QH TD JC 2D 8S", :player_one
test_game "TH 8H 5C QS TC 9H 4D JC KS JS", :player_two
test_game "7C 5H KC QH JD AS KH 4C AD 4S", :player_two
test_game "5H KS 9C 7D 9H 8D 3S 5D 5C AH", :player_one
test_game "6H 4H 5C 3H 2H 3S QH 5S 6S AS", :player_one
test_game "TD 8C 4H 7C TC KC 4C 3H 7S KS", :player_two
test_game "7C 9C 6D KD 3H 4C QS QC AC KH", :player_two
test_game "JC 6S 5H 2H 2D KD 9D 7C AS JS", :player_one
test_game "AD QH TH 9D 8H TS 6D 3S AS AC", :player_two
test_game "2H 4S 5C 5S TC KC JD 6C TS 3C", :player_one
test_game "QD AS 6H JS 2C 3D 9H KC 4H 8S", :player_one
test_game "KD 8S 9S 7C 2S 3S 6D 6S 4H KC", :player_two
test_game "3C 8C 2D 7D 4D 9S 4S QH 4H JD", :player_two
test_game "8C KC 7S TC 2D TS 8H QD AC 5C", :player_two
test_game "3D KH QD 6C 6S AD AS 8H 2H QS", :player_two
test_game "6S 8D 4C 8S 6C QH TC 6D 7D 9D", :player_one
test_game "2S 8D 8C 4C TS 9S 9D 9C AC 3D", :player_two
test_game "3C QS 2S 4H JH 3D 2D TD 8S 9H", :player_one
test_game "5H QS 8S 6D 3C 8C JD AS 7H 7D", :player_two
test_game "6H TD 9D AS JH 6C QC 9S KD JC", :player_one
test_game "AH 8S QS 4D TH AC TS 3C 3D 5C", :player_two
test_game "5S 4D JS 3D 8H 6C TS 3S AD 8C", :player_two
test_game "6D 7C 5D 5H 3S 5C JC 2H 5S 3D", :player_two
test_game "5H 6H 2S KS 3D 5D JD 7H JS 8H", :player_two
test_game "KH 4H AS JS QS QC TC 6D 7C KS", :player_one
test_game "3D QS TS 2H JS 4D AS 9S JC KD", :player_two
test_game "QD 5H 4D 5D KH 7H 3D JS KD 4H", :player_one
test_game "2C 9H 6H 5C 9D 6C JC 2D TH 9S", :player_one
test_game "7D 6D AS QD JH 4D JS 7C QS 5C", :player_one
test_game "3H KH QD AD 8C 8H 3S TH 9D 5S", :player_one
test_game "AH 9S 4D 9D 8S 4H JS 3C TC 8D", :player_one
test_game "2C KS 5H QD 3S TS 9H AH AD 8S", :player_two
test_game "5C 7H 5D KD 9H 4D 3D 2D KS AD", :player_one
test_game "KS KC 9S 6D 2C QH 9D 9H TS TC", :player_two
test_game "9C 6H 5D QH 4D AD 6D QC JS KH", :player_two
test_game "9S 3H 9D JD 5C 4D 9H AS TC QH", :player_one
test_game "2C 6D JC 9C 3C AD 9S KH 9D 7D", :player_two
test_game "KC 9C 7C JC JS KD 3H AS 3C 7D", :player_one
puts "tests complete"
