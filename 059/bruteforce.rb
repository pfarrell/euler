require 'byebug'

def xor(cipher, key)
  cipher.each_with_index.map{|n,i| n^key[i%key.size]} 
end

def examine(arr)
  arr.each {|x| return false unless x >= 32}
  true
end

def translate(arr)
  arr.map{|x| x.chr}.join
end

cipher=[]
dict={}
File.readlines(ARGV[0]).each do |line|
  cipher = line.split(',').map{|x| x.to_i}
end

File.readlines(ARGV[1]).each do |line|
  dict[line.strip] = nil
end

(32..128).each do |x|
  (32..128).each do |y|
    (32..128).each do |z|
      byebug if examine(xor(cipher, [x,y,z]))
    end
  end
end
