require 'byebug'
class Fixnum
  def digits
    self.to_s.length
  end

  def left(n)
    self.to_s[0,n].to_i
  end

  def gen_pandigital(len)
    ctr = 0
    seed = self
    retval = ""
    while retval.length < 9
      ctr += 1
      retval << (seed * ctr).to_s
    end
    retval.to_i
  end
end

search_space = []
[1,2,3,4,5,6,7,8,9].permutation(9).each do |x| 
  n = x.join.to_i
  search_space << n if n >= 918273645
end

#puts search_space.size

search_space.each do |val|
  (1..val.digits/2).each do |len|
    print "#{val}\n" if  val.left(len).gen_pandigital(9) == val
  end
end
