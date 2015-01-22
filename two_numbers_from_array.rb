# Problem 1: Given an increasingly sorted array and a number s, please find two numbers whose sum is s. 
#If there are multiple pairs with sum s, just output any one of them.
# For example, if the inputs are an array {1, 2, 4, 7, 11, 15} and a number 15, please out two numbers 4 and 11 since 4+11=15.

def get_touple(array, sum)
  size = array.size
  return nil if array.nil? or size < 1 
  last_number = size -1
  i = 0
  (size/2).times do |i|
    return [array[i], array[last_number]] if  array[i] + array[last_number] == sum
    last_number -= 1 if array[i] + array[last_number] > sum 
  end
  return nil
end


puts get_touple([1, 2, 4, 7, 11, 15], 15)
puts get_touple([1, 2, 4, 7, 11, 14], 15)
puts get_touple([1, 2, 4, 7, 10, 15], 17)
puts get_touple([1,  15], 17).nil?
puts get_touple([2,  15], 17)
puts get_touple([1], 17).nil?