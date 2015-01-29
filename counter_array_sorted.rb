# Given an array of ages (integers) sorted lowest to highest, output the number of occurrences for each age. 
# For instance: 
# [8,8,8,9,9,11,15,16,16,16] 
# should output something like: 
# 8: 3 
# 9: 2 
# 11: 1 
# 15: 1 
# 16: 3 

# This should be done in less than O(n).

ages = [8,8,8,9,9,11,15,16,16,16]

#o(n)
def counter_ages(ages)
  counter = []
  ages.each do |a|
    !counter[a].nil? ? (counter[a] += 1) : (counter[a] = 1)
  end
  counter.each_with_index do |counter, i|
    puts "#{i} : #{counter}" unless counter.nil?
  end
end

#counter_ages(ages)

#less than O(n).
def counter_ages_binary(ages)
  counter = []
  binary_counter(ages, 0, ages.size-1, ages.size-1, counter)
  counter.each_with_index {|e,i| puts "#{i}: #{e}" if e}
end

def binary_counter(ages, start_position, last_position, max_size, counter)
  if ages[start_position] == ages[last_position]
    age = ages[start_position]
    !counter[age].nil? ? (counter[age] += last_position - start_position +1) : (counter[age] = last_position - start_position +1 )
    return true
  end
  median = (start_position+last_position)/2
  binary_counter(ages, start_position, median, max_size, counter)
  binary_counter(ages, median+1, last_position, max_size, counter)
end

counter_ages_binary(ages)


