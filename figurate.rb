class Numeric

  def triangle?
    quadratic(0.5, 0.5, -1*self).select{|x| x.whole?}.size > 0
  end

  def square?
    Math.sqrt(self).whole?  
  end

  def pentagonal?
    quadratic(1.5, -0.5, -1*self).select{|x| x.whole?}.size > 0
  end

  def hexagonal?
    quadratic(2, -1, -1*self).select{|x| x.whole?}.size > 0
  end

  def heptagonal?
    quadratic(2.5, -1.5, -1*self).select{|x| x.whole?}.size > 0 
  end

  def octagonal?
    quadratic(3, -2, -1*self).select{|x| x.whole?}.size > 0
  end

  def quadratic(a, b, c)
    sq=Math.sqrt((b**2) - (4*a*c))
    [(-1*b+sq)/(2*a), (-1*b-sq)/(2*a)]
  end

  def whole?
    self % 1 == 0
  end

end

class Range
  def figurate(method)
    self.select{|x| x.send(method)}
  end
end

