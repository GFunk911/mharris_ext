class Fixnum
  def of
    res = []
    self.times { res << yield }
    res
  end
end

module Enumerable
  def sumx
    res = 0
    each { |x| res += x }
    res
  end
  def sum_b
    map { |x| yield(x) }.sum
  end
  def avg_b(&b)
    sum_b(&b).to_f / size.to_f
  end
end

module Enumerable
  def nths_hashx(num)
    res = {}
    s = e_f = e_i = 0
    n_size = size.to_f / num.to_f
    total_segment_size = 0
    (0...num).each do |n|
      s = e_i
      e_f = e_f + n_size
      e_i = (e_f+0.5).to_i
      seg = self[s...e_i]
     # puts %w(s e_f e_i seg).map { |x| "#{x}: #{send(x)}" }.join("\n")
      #puts "s: #{s}, e_f: #{e_f}, e_i: #{e_i}, seg: #{seg.inspect}"
      res[n] = seg
      total_segment_size += res[n].size
    end
    unless total_segment_size == size
      puts inspect
      puts res.inspect
      raise "nths_hash is bad" 
    end
    res
  end
  def nths(num)
    res = []
    s = e_f = e_i = 0
    n_size = size.to_f / num.to_f
    total_segment_size = 0
    (0...num).each do |n|
      s = e_i
      e_f = e_f + n_size
      e_i = (e_f+0.5).to_i
      seg = self[s...e_i]
     # puts %w(s e_f e_i seg).map { |x| "#{x}: #{send(x)}" }.join("\n")
      #puts "s: #{s}, e_f: #{e_f}, e_i: #{e_i}, seg: #{seg.inspect}"
      res << seg
      total_segment_size += res[n].size
    end
    unless total_segment_size == size
      puts inspect
      puts res.inspect
      raise "nths_hash is bad" 
    end
    res
  end
  def nths_hash(num)
    res = {}
    nths(num).each_with_index { |x,i| res[i] = x }
    res
  end
end

res = [1,2,3,4,5,6].nths_hash(3)
exp = {0 => [1,2], 1 => [3,4], 2 => [5,6]}
unless res == exp
  puts res.inspect
  puts exp.inspect
  raise "nths_hash doesn't work"
end

res = [1,2,3,4,5,6,7].nths_hash(3)
exp = {0 => [1,2], 1 => [3,4,5], 2 => [6,7]}
unless res == exp
  puts res.inspect
  puts exp.inspect
  raise "nths_hash doesn't work"
end

class Hash
  def map_value
    res = {}
    each { |k,v| res[k] = yield(v) }
    res
  end
end

class Numeric
  def commify
    to_s.commify
  end
end

class String
  def commify
    return self if length <= 3
    self[0...-3].commify + "," + self[-3..-1]
  end
end
      