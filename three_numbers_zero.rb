# Problem 2: Given an array, please determine whether it contains three numbers whose sum equals to 0.


def has_three_numbers_with_sum(array, sum = 0)
  array.sort!
  size = array.size
  j = size -1
  h = 0
  (size/2).times do |i|
    sum_array = array[i+1] + array[j] + array[h]
    puts "#{i+1} #{j} #{h}"
    return [array[i+1], array[j], array[h]] if sum == sum_array
    j -= 1 if sum_array > sum
    h += 1 if sum_array < sum
  end
  return nil
end

puts has_three_numbers_with_sum([-2,0,0,2,3])