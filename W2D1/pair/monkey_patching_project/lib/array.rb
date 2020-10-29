# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum  / (self.length * 1.0)
  end

  def median
    return nil if self.empty?
    arr = self.sort
    i = arr.length / 2
    if arr.length.even?
        return (arr[i - 1] + arr[i]) / 2.0
    else
        return arr[i]
    end
  end

  def counts
    hash = Hash.new(0)
    self.each {|ele| hash[ele] += 1}
    hash
  end

  def my_count(ele)
    hash = Hash.new(0)
    self.each {|el| hash[el] += 1}
    return hash[ele]
  end

  def my_index(value)
    return nil if !self.include?(value)
    self.each_with_index do |ele, i|
        if ele == value
            return i
        end
    end
  end

  def my_uniq
  #   arr = []
  #   self.sort.inject do |acc, ele|
  #       if acc != ele
  #           arr << acc
  #           acc = ele
  #       else
  #           acc = ele
  #       end
  #   end
  #   arr
  # end

    hash = Hash.new(0)
    self.each {|ele| hash[ele] += 1}
    hash.keys
  end

  def my_transpose
    arr = Array.new(self[0].length){Array.new(self.length)}
    self.each_with_index do |subArr, i|
        subArr.each_with_index do |ele,j|
            arr[j][i] = ele
        end
    end
    arr
  end

end
