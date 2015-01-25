# Given a 4 X 4 game slot that has random alphabets in all the slots 
# Write a function that takes the keyboard and the word as input and returns true if the word can be formed 
# False otherwise. 

# A word can be formed on the board by connecting alphabets adjacent to each other (horizontal, vertical and diagonally) 
# Same alphabet should not be reused.

GraphWord = Struct.new(:word, :right ,:top, :left, :bottom, :right_top, :left_top, :right_bottom, :left_bottom)

words = [["S", "T", "F", "M"],["R", "U", "W", "G"],["T", "A", "M", "N"],["E", "O", "N", "I"]]

def build_graph(words)
  nodes = {}
  #create nodes
  words.each_with_index do |list_word, j|
    list_word.each_with_index do |c, i|
      nodes["#{j}#{i}"] = GraphWord.new(c)
    end
  end
  #set connections
  words.each_with_index do |list_word, j|
    list_word.each_with_index do |c, i|
      node = nodes["#{j}#{i}"]
      #right
      if list_word[i+1]
        node.right = nodes["#{j}#{i+1}"]
      end 

      #left
      if list_word[i-1]
        node.left = nodes["#{j}#{i-1}"]
      end
      #top
      if words[j-1] and words[j-1][i]
        node.top = nodes["#{j-1}#{i}"]
      end

      #bottom
      if words[j+1]and words[j+1][i]
        node.bottom = nodes["#{j+1}#{i}"]
      end

      #right_top
      if words[j-1] and words[j-1][i+1] 
        node.right_top = nodes["#{j-1}#{i+1}"]
      end

      #left top
      if words[j-1] and words[j-1][i-1] 
        node.left_top = nodes["#{j-1}#{i-1}"]
      end

      #right bottom
      if words[j+1] and words[j+1][i+1] 
        node.right_bottom = nodes["#{j+1}#{i+1}"]
      end

      #left bottom 
      if words[j+1] and words[j+1][i-1] 
        node.left_bottom = nodes["#{j+1}#{i-1}"]
      end
    end
  end
  return nodes
end

def find_word(list_word, word)
  return false if word.nil? or word.size > list_word.count
  graph = build_graph(list_word)
  graph.each do |node|
    selected_node = node[1] #is a hash if a node
    next if selected_node.word != word[0]
    return true if selected_node.word == word
    [:right ,:top, :left, :bottom, :right_top, :left_top, :right_bottom, :left_bottom].each do |command|
      return true if deep_find(selected_node[command], command, 1, word)
    end
  end
  return false
end

def deep_find(node, command, index_word, word)
  return false if node.nil? or node.word != word[index_word]
  if node.word == word[index_word]
      return true if index_word == word.size - 1
      return deep_find(node[command], command, index_word + 1, word)
  end
end


puts find_word(words, "NMWF")
puts find_word(words, "S")
puts find_word(words, "STF")
puts find_word(words, "")
puts find_word(words, "SUMI")
puts find_word(words, "TUAO")
puts find_word(words, "CASA")
puts find_word(words, "AAAAA")