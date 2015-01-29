
# Question: Given an array and a value, how to implement a function to remove all instances 
#of that value in place and return the new length? 
#The order of elements can be changed. It doesn't matter what you leave beyond the new length.

# For example, if the input array is {4, 3, 2, 1, 2, 3, 6}, 
#the result array after removing value 2 contains numbers {4, 3, 1, 3, 6}, and the new length of the remaining array is 5.
array = [2, 2, 2, 2, 2, 2, 2, 2]


def basic_way(array, number)
  return array - [number]
end

#puts basic_way(array, 2)

def faster_way(array, number)
  p = array.size - 1
  i = 0
  last_element = array.size 
  while i < last_element -1
    if array[i] == number
      while array[p] == number and p != -1
        last_element -= 1
        p -= 1
      end
      aux = array[p]
      array[p] = array[i]
      array[i] = aux
      last_element -= 1
    else 
      i += 1 
    end
  end
  array[0, last_element] 
end

puts faster_way([2, 2, 2, 2, 2, 2, 2, 2], 2).nil?
puts faster_way([2, 2, 2, 2, 2, 2, 2, 3, 4, 5, 6, 7, 7], 2).inspect
puts faster_way([5, 6, 7, 2, 2, 2, 2, 3, 4, 5, 6, 7, 7], 2).inspect
puts faster_way([5, 2, 7, 2, 2, 2, 2, 3, 4, 5, 6, 7, 2], 2).inspect