class MaxIntSet
  attr_reader :max
  def initialize(max)
    @range = Array.new(max) {false}
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    # @range << num if num < @max && num > 0
    @range[num] = true

  end

  def remove(num)
    @range[num] = false
  end

  def include?(num)
    @range[num] ? true : false
  end

  private
  def is_valid?(num)

  end

  def validate!(num)

  end
end


class IntSet
  attr_accessor :store, :num_buckets
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    @store[num % @num_buckets] << num
  end

  def remove(num)
    @store[num % @num_buckets].delete(num)
  end

  def include?(num)
    @store[num % @num_buckets].include?(num) ? true : false
  end

  private

  def [](num)
    # @store[num % @num_buckets] = num
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  
  attr_accessor :store, :num_buckets, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
      if !@store[num % @num_buckets].include?(num)
        @store[num % @num_buckets] << num 
        @count += 1
      end
      # resize! if @num_buckets < @count
  end

  def remove(num)
    if @store[num % @num_buckets].include?(num)
      @store[num % @num_buckets].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    @store[num % @num_buckets].include?(num) ? true : false
  end


  def send(thing)
    thing
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  self.count = 0
  self.store = Array.new(@num_buckets * 2) { Array.new }
  old_store = self.store

  old_store.flatten.each { |num| self.insert(num) }
  end
end

