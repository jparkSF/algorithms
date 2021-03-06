class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash

    result = 0

    self.each_with_index do |el,idx|
        result += (el + idx).hash


        # result += (el.hash + idx.hash)



    end

    result

  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash

    result = 0

    self.keys.each do |key|
      result +=  (self[key].to_s + key.to_s).to_i.hash
    end
    result

  end
end
