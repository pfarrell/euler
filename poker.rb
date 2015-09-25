require 'byebug'
class Hand
  attr_accessor :raw, :values, :suits

  def initialize
    @values = Hash.new(0)
    @suits = Hash.new(0)
  end

  def deal(str)
    @raw = str.strip.split(' ')
    @values = Hash.new(0)
    @suits = Hash.new(0)
    @raw.each do |card|
      add_card(card)
    end
  end

  def add_card(str)
    @values[cardify(str[0])] += 1
    @suits[str[1]] += 1
  end

  def cards(num)
    @values.select{|card,cnt| cnt == num}.keys.sort_by{|x| x*-1}
  end
  
  def consec?(arr)
    last = nil
    arr.each do |i|  
      last = i-1 if last.nil?
      return false if last + 1 != i
      last = i
    end
    true
  end

  def cardify(char)
    case(char)
      when 'T'
        10
      when 'J'
        11
      when 'Q'
        12
      when 'K'
        13
      when 'A'
        14
      else
        char.to_i
    end
  end

  def of_a_kind(num)
    @values.select{|card, cnt| cnt == num}
  end

  def pair?
    of_a_kind(2).size == 1
  end

  def three_of_a_kind?
    of_a_kind(3).size == 1
  end

  def four_of_a_kind?
    of_a_kind(4).size == 1
  end

  def two_pairs? 
    of_a_kind(2).size == 2
  end

  def full_house?
    of_a_kind(2).size == 1 && of_a_kind(3).size == 1
  end
  
  def high_card
    @values.select{|card, cnt| cnt == 1}.keys.sort.last
  end

  def straight?
    consec?(@values.keys.sort) && @values.size == 5
  end

  def straight_flush?
    straight? && flush?
  end

  def flush?
    @suits.size == 1
  end

  def royal_flush?
    straight_flush? && @values.select{|i| i==14}.size == 1
  end

  def hand_value
    return 9 if royal_flush?
    return 8 if straight_flush?
    return 7 if four_of_a_kind?
    return 6 if full_house?
    return 5 if flush?
    return 4 if straight?
    return 3 if three_of_a_kind?
    return 2 if two_pairs?
    return 1 if pair?
    return 0
  end

  def value
    {"hand_value" => hand_value,
            "raw" => @raw,
          "suits" => @suits,
               4  => of_a_kind(4).keys.sort_by{|x| -x},
               3  => of_a_kind(3).keys.sort_by{|x| -x},
               2  => of_a_kind(2).keys.sort_by{|x| -x},
               1  => of_a_kind(1).keys.sort_by{|x| -x}
    }
  end
end

class Game
  attr_accessor :player_one, :player_two

  def initialize
    @player_one = Hand.new
    @player_two = Hand.new
  end

  def deal(str)
    @player_one.deal(str[0..14])
    @player_two.deal(str[15..-1])
  end

  def winner
    p1, p2 = @player_one.value, @player_two.value
    #puts p1 if p1["hand_value"] > 2 || p2["hand_value"] > 2 
    #puts p2 if p1["hand_value"] > 2 || p2["hand_value"] > 2
    #byebug if p1["hand_value"] > 2 || p2["hand_value"] > 2
    return :player_one if p1["hand_value"] > p2["hand_value"]
    return :player_two if p1["hand_value"] < p2["hand_value"]
    return break_tie(p1, p2)
  end

  def break_tie(p1, p2)
    return bbreak(p1[4], p2[4]) unless p1[4].size == 0 || bbreak(p1[4], p2[4]).nil?
    return bbreak(p1[3], p2[3]) unless p1[3].size == 0 || bbreak(p1[3], p2[3]).nil?
    return bbreak(p1[2], p2[2]) unless p1[2].size == 0 || bbreak(p1[2], p2[2]).nil?
    return bbreak(p1[1], p2[1]) unless p1[1].size == 0 || bbreak(p1[1], p2[1]).nil?
  end

  def bbreak(p1, p2)
    (0..p1.size-1).each do |i|
      return :player_one if p1[i] > p2[i]
      return :player_two if p1[i] < p2[i]
    end
    nil
  end
end
