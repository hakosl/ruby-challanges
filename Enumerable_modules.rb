module Enumerable
  def my_each
    output = []
    for i in self
      output << yield(i)
    end
    output.join(" ")
  end

  def my_each_with_index
    output = []
    for i in (0..(self.length-1))
      output << yield(self[i], i)
    end
    output.join(" ")
  end

  def my_select
    output = []
    self.my_each {|item| output << item if yield(item)}
    output
  end

  #Recreating the Enumerable#any function, if list contains looking_for return true
  def my_any? looking_for
    output = false
    self.my_each {|item| output = true if item == looking_for}
    output
  end

  #Recreating the Enumerable#any function, if list consist off all looking_for 
  #return true
  def my_all? looking_for
    output = true
    self.my_each {|item| output = false if item != looking_for}
    output
  end

  def my_none? looking_for
    output = true
    self.my_each {|item| output = false if item == looking_for}
    output
  end

  def my_count looking_for
    count = 0
    self.my_each {|item| count += 1 if item == looking_for}
    count
  end

  #my map taking a lambda
=begin
  def my_map
    output = []
    for i in self
      output << yield(i)
    end
    output
  end

=end

  #my_map taking a block
  def my_map block
    output = []
    for i in self
      output << block.call(i)
    end
    output
  end


  #implemention of Enumerable#inject by myself
  def my_inject(num = 0)
    result = num
    self.my_each do |item|
      result = yield(result, item)
    end
    result
  end


end



#test for my_inject
def multiply_els numbers
  numbers.my_inject(1) {|result, item| result * item}
end



