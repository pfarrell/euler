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
test_game "5S 9H QH 4S 6S 6C 6D TS TH 7S", :player_two
test_game "6C 4C 6D QS JS 9C TS 3H 8D 8S", :player_two
test_game "JS 5C 7S AS 2C AH 2H AD 5S TC", :player_two
test_game "KD 6C 9C 9D TS 2S JC 4H 2C QD", :player_one
test_game "QS 9H TC 3H KC KS 4H 3C AD TH", :player_two
test_game "KH 9C 2H KD 9D TC 7S KC JH 2D", :player_one
test_game "7C 3S KC AS 8C 5D 9C 9S QH 3H", :player_two
test_game "2D 8C TD 4C 2H QC 5D TC 2C 7D", :player_one
test_game "KS 4D 6C QH TD KH 5D 7C AD 8D", :player_two
test_game "2S 9S 8S 4C 8C 3D 6H QD 7C 7H", :player_one
test_game "6C 8S QH 5H TS 5C 3C 4S 2S 2H", :player_two
test_game "8S 6S 2H JC 3S 3H 9D 8C 2S 7H", :player_one
test_game "QC 2C 8H 9C AC JD 4C 4H 6S 3S", :player_two
test_game "3H 3S 7D 4C 9S 5H 8H JC 3D TC", :player_one
test_game "QH 2S 2D 9S KD QD 9H AD 6D 9C", :player_one
test_game "8D 2D KS 9S JC 4C JD KC 4S TH", :player_two
test_game "KH TS 6D 4D 5C KD 5H AS 9H AD", :player_one
test_game "QD JS 7C 6D 5D 5C TH 5H QH QS", :player_one
test_game "9D QH KH 5H JH 4C 4D TC TH 6C", :player_one
test_game "KH AS TS 9D KD 9C 7S 4D 8H 5S", :player_one
test_game "KH AS 2S 7D 9D 4C TS TH AH 7C", :player_one
test_game "KS 4D AC 8S 9S 8D TH QH 9D 5C", :player_one
test_game "5D 5C 8C QS TC 4C 3D 3S 2C 8D", :player_one
test_game "9D KS 2D 3C KC 4S 8C KH 6C JC", :player_one
test_game "8H AH 6H 7D 7S QD 3C 4C 6C KC", :player_one
test_game "3H 2C QH 8H AS 7D 4C 8C 4H KC", :player_one
test_game "QD 5S 4H 2C TD AH JH QH 4C 8S", :player_one
test_game "3H QS 5S JS 8H 2S 9H 9C 3S 2C", :player_one
test_game "6H TS 7S JC QD AC TD KC 5S 3H", :player_one
test_game "QH AS QS 7D JC KC 2C 4C 5C 5S", :player_one
test_game "QH 3D AS JS 4H 8D 7H JC 2S 9C", :player_one
test_game "5D 4D 2S 4S 9D 9C 2D QS 8H 7H", :player_one
test_game "6D 7H 3H JS TS AC 2D JH 7C 8S", :player_one
test_game "JH 5H KC 3C TC 5S 9H 4C 8H 9D", :player_one
test_game "8S KC 5H 9H AD KS 9D KH 8D AH", :player_one
test_game "JC 2H 9H KS 6S 3H QC 5H AH 9C", :player_one
test_game "5C KH 5S AD 6C JC 9H QC 9C TD", :player_one
test_game "5S 5D JC QH 2D KS 8H QS 2H TS", :player_one
test_game "JH 5H 5S AH 7H 3C 8S AS TD KH", :player_one
test_game "6H 3D JD 2C 4C KC 7S AH 6C JH", :player_one
test_game "4C KS 9D AD 7S KC 7D 8H 3S 9C", :player_one
puts "tests complete"
