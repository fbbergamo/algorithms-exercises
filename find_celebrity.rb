# Given a set of n people, find the celebrity. 
# Celebrity is a person who: 
# 1. Knows only himself and no one else 
# 2. Every one else knows this person 

# You are given the following helper function: 
# bool knows(i, j); 
# Returns: 
# True: If i knows j 
# False: otherwise 

# I proposed the O(n2) algorithm at first but he wanted me to improve on it. He wanted an O(n) algorithm


people = (0..10).to_a
#herlper mock 

def knows(i, j)
end

def find_celebrity(people)
  celebrity = people[0]
  people.each do |n|
    if knows(celebrity, n) and (celebrity != n)
      celebrity = -1
      celebrity = n unless knows(n, celebrity) 
    end
  end

end