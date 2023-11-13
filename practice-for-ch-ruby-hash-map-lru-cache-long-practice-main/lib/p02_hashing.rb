class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_value = 0
    (0...self.length).each do |i|
      hash_value += i + 1
      if self[i].is_a?(Integer)
        hash_value += self[i] * i 
      end
    end
    return hash_value
  end
end

class String
  def hash
    
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end