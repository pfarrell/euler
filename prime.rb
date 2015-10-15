class Prime
  
  def initialize
    @prime_cache = {}
    @factor_cache = {}
    @coprime_cache = {}
  end

  def prime?(x)
    return @prime_cache[x] if @prime_cache.has_key?(x)
    ret=true
    if x < 2
      ret = false
    elsif x == 2 || x == 3
      ret = true
    elsif x % 2 == 0
      ret = false 
    else
      (3..Math.sqrt(x)).step(2).each do |i| 
        ret = false if x % i == 0
        break unless ret
      end
    end
    @prime_cache[x] = ret
    return ret
  end

  def composite?(x)
    !prime?(x)
  end

  def factors(x)
    return @factor_cache[x] if @factor_cache.has_key?(x)
    ret = [1]
    if !prime?(x) 
      curr = x
      while curr > 1
        if prime?(curr)
          ret << curr
          break
        else
          ff = first_factor(x)
          ret << ff
          curr /= ff
        end
      end
    end
    ret << x
    @factor_cache[x] = ret
    ret
  end

  def first_factor(x)
    return if prime?(x)
    (2..x/2).each do |n|
      next unless prime?(n)
      return n if x % n == 0
    end
  end

  def coprimes(n)
    return @coprime_cache[n] if @coprime_cache.has_key?(n)
    ret = [1]
    (2..n-1).map do |x| 
      ret << x if factors(n).intersect(factors(x)) == [1]
    end
    @coprime_cache[n] = ret
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

