class MaxIntSet # [0, 1, 2, 3]
  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > @max || num < 0
      raise 'Out of bounds'
    else 
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20) [0, 1 , 2, 3]
    @store = Array.new(num_buckets) {Array.new}
  end

  def insert(num)
    @store[num % @store.length] << num
  end

  def remove(num)
    index = @store[num % @store.length].index(num)
    @store[num % @store.length].delete_at(index)
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
     self[num] << num
     @count += 1
    end
    resize! if @store.length < @count
  end

  def remove(num)
    if self.include?(num)
      index = self[num].index(num)
      self[num].delete_at(index)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    previous = @store.dup
    new_size = @store.length * 2
    @store = Array.new(new_size) { Array.new }

    previous.each do |bucket|
      bucket.each do |ele|
        @store[ele % @store.length] << ele 
      end
    end

  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end
end