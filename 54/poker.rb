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
    of_a_kind(2) && of_a_kind(3)
  end
  
  def high_card
    @values.select{|card, cnt| cnt == 1}.keys.sort.last
  end

  def straight?
    consec?(@values.keys.sort)
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
    {"hand_value": hand_value, 
     "suits": @suits.size,
     "raw": @raw,
     "five": @values.select{|


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
    return :player_one if @player_one.hand_value > @player_two.hand_value
    return :player_two if @player_one.hand_value < @player_two.hand_value
    return break_tie(@player_one.hand_value)
  end

  def break_tie(hand_value)
    #puts "[#{@player_one.raw}] [#{@player_two.raw}]"
    case hand_value
      when 0
        decide_high_card
      when 1
        decide_pairs
      else
        "#{@player_one.raw}, #{@player_two.raw}"
    end
  end

  def decide_high_card
    return :player_one if @player_one.high_card > @player_two.high_card
    return :player_two if @player_one.high_card < @player_two.high_card
    return "#{@player_one.raw}, #{@player_two.raw}"
  end

  def decide_pairs
    require 'byebug'
    return :player_one if @player_one.cards(2)[0] > @player_two.cards(2)[0]
    return :player_two if @player_one.cards(2)[0] < @player_two.cards(2)[0]
    
    
    (0..min(@player_one.cards(1).size, @player_two.cards(1).size)).each do |i|
      return :player_one if @player_one.cards(1)[i] > @player_two.cards(1)[i]
      return :player_two if @player_one.cards(1)[i] < @player_two.cards(1)[i]
    end
  end

  def min(x,y)
    return x if x < y
    return y
  end
end
