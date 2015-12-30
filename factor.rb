class Integer
  def prime?
    return false if self < 2
    return true if self == 2 || self == 3
    return false if self % 2 == 0
    (3..Math.sqrt(self)).step(2).each{|i| return false if self % i == 0}
    return true
  end

  def composite?
    !prime?
  end

  def factors
    ret = [1]
    if !self.prime? 
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
    end
    ret << self
    ret
  end

  def first_factor
    return if self.prime?
    (2..self/2).each do |n|
      next unless n.prime?
      return n if self % n == 0
    end
  end

  def coprimes
    ret = [1]
    (2..self-1).map do |x| 
      ret << x if self.factors.intersect(x.factors) == [1]
    end
    ret
  end
end

class Array
  def intersect(arr)
    iter = []
    ret = []
    arr.map{|x| iter << x}
    self.map{|x| iter << x}
    iter.uniq.each do |x|
      if(arr.select{|n| n == x}.size >= 1) 
        if(self.select{|n| n == x}.size >= 1)
          ret << x
        end
      end
    end
    ret
  end
end

