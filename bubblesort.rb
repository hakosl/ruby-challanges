def bubble_sort(numbers)
  (numbers.length-1).times do |time|
    numbers.each.with_index do |number, index|
      if numbers[index + 1] == nil
        break
      end
      if numbers[index] > numbers[index + 1]
        numbers[index], numbers[index + 1] = numbers[index + 1], numbers[index]
      end
    end
  end
  numbers
end

def bubble_sort_by(strings)
  (strings.length).times do |time|
    strings.each.with_index do |string, index|
      if strings[index + 1] == nil
        break
      end

      if yield(strings[index], strings[index + 1]) > 0
        strings[index], strings[index + 1] = strings[index + 1], strings[index]
      end
    end
  end
  strings
end


p bubble_sort([4,3,78,2,0,2])
p bubble_sort_by(["hi", "hello", "hey"]) { |left, right| right.length - left.length}