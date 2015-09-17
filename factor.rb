class Integer
  def prime?
    return false if self < 2
    return true if self == 2 || self == 3
    return false if self % 2 == 0
    (3..Math.sqrt(self)).step(2).each{|i| return false if self % i == 0}
    return true
  end

  def factors
    ret = []
    return ret if self.prime? 
    curr = self
    while curr > 1
      if curr.prime?
        ret << curr
        break
      else
        ff = curr.first_factor
        ret << ff
        curr /= ff
      end
    end
    ret
  end

  def first_factor
    return if self.prime?
    (2..self/2).each do |n|
      next unless n.prime?
      return n if self % n == 0
    end
  end
end


