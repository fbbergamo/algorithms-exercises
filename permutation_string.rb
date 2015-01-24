
# Write a function that given a string, returns all nearby words. You are given the following helper 
# functions: Set<String> getNearbyChars(char c); isWord(String word);
require "set"

#Tests eadge 
# go -> gi, go, gk, hi, ho, hk, fi, fo, fk 
def nerbys_words(word)
  valid_words = []
  permutations =  set_permutations_recusive(word, 0)
  permutations.each do |p|
    valid_words << p if word?(p)
  end 
  valid_words
end

def set_permutations(word)
  news_words = Set.new
  word.split(//).each_with_index do |char, index|
    set_nearby_chars = get_nearby_chars(char)
    set_nearby_chars.each do |c|
      new_word = word.clone
      new_word[index] = c
      news_words <<  new_word
    end
  end
  news_words
end

def set_permutations_recusive(word, index)
  if (index > word.length - 1)
    return Set.new([""])
  end
  sub_words = set_permutations_recusive(word, index+1)
  set_nearby_chars = get_nearby_chars(word[index])

  news_words = Set.new
  sub_words.each do |w|
    set_nearby_chars.each do |c|
      news_words <<  "#{c}#{w}"
    end
  end
  return news_words
end

# helpers examples mock
def get_nearby_chars(char)
  hash = {}
  return Set.new(["g","h","f"]) if char == "g"
  return Set.new(["i","o","k"]) if char == "i"
end

def word?(word)
  return word == "go" || word == "hi"
end


puts nerbys_words("gi")
puts nerbys_words("ig").empty?


puts "otimizar algoritimo o(n) mudando os helpers"
#OTIMIZADO
#helpers examples
#{ghf} -> g
#{hi} -> i

#go -> {ghf}o
#hi -> {iok}i


#Tests eadge 
# gi -> g(iok), (ghf)i
def nerbys_words_otimizer(word)
  valid_words = []
  text = permutation_recusive_otimazer(word,0)
  list_word(text)
end


def permutation_recusive_otimazer(word, index)
  if (index > word.length - 1)
    return ""
  end
  sub_words = permutation_recusive_otimazer(word, index+1)
  set_nearby_chars = get_nearby_chars_otimizer(word[index])
  return "#{set_nearby_chars}#{sub_words}"
end

def get_nearby_chars_otimizer(char)
  hash = {}
  return "(ghf)" if char == "g"
  return "(iok)" if char == "i"
end

def list_word(word)
  { "(ghf)(iok)" => ["hi","go"], "(iok)(ghf)" => [] }[word]
end

puts nerbys_words_otimizer("ig").empty?
puts nerbys_words_otimizer("gi")

