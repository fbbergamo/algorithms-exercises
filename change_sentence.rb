# Inplace reverse a sentence 

# You given a sentence of english words and spaces between them. 
# Nothing crazy: 
# 1) no double spaces 
# 2) no empty words 
# 3) no spaces at the ends of a sentence


# void inplace_reverse(char* arr, int length) {
#     // your solution
# }
# Example: 
# input "I wish you a merry Christmas" 
# output "Christmas merry a you wish I" 

# Constrains: O(1) additional memory

def inplace_reverse(string, length)
  revert_word(string, 0 , length-1)
  i = 0
  while i < length
    j = i
    while (string[i] != " " and i < length) do
      puts i 
      i += 1
    end
    puts string[j..i-1]
    revert_word(string, j, i-1)
    puts "#{j} #{i-1} "
    i += 1
  end
  puts string
end

#memory keep 1
def revert_word(word, start, last) 
  puts word
  j = 0
  (start..((last + start)/2)).each do |i|
    word[i], word[last-j] = word[last-j], word[i]
    j += 1 
  end
end



a = "I wish you a merry Christmas"
inplace_reverse(a, a.size)
