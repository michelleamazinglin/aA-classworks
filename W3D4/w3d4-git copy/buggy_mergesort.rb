# merge sort - break down array into halves until we have single element and piece it back together while sorting.
require 'byebug'
class Array
  def merge_sort(&prc)
    return self if self.count <= 1

    prc ||= Proc.new { |a, b| a <=> b }
    # prc = prc || Proc.new { |a, b| a <=> b } # long-form

    middle = self.length / 2
    left = self[0...middle]
    right = self[middle..-1]
    # debugger
    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)
    Array.merge(sorted_left, sorted_right, prc)
  end

  # private
  def self.merge(left, right, prc)
    result = []
    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) <= 0
        result << left.shift
      else
        result << right.shift
      end
    end

    result + left + right
  end
end


array = [5, 4, 300, 25, 21, 26, 24]

# p array.merge_sort

p array.merge_sort { |a, b| b <=> a } 