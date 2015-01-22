# The closest common ancestor in a tree forest.


# class Node {
#     Node* parent; // == null for root of tree
#     Node* left;
#     Node* right;
# }

# Node* tree_forest[]; // array of pointers which points to roots of each tree respectively

# Node* closest_common_ancestor(Node* n1, Node* n2) {
#     // your solution
# }
# Example:


# |    a     |   j
# |   / \    |  /
# |  b   c   | h
# | /   / \  |
# |d   e   f |
# for e and d CCA is a 
# for e and f CCA is c 
# for e and c CCA is c 
# for h and d CCA is null 

# Constrains: O(1) additional memory

def closest_common_ancestor(n1, n2)
  n1_level =  get_node_level(n1)
  n2_level =  get_node_level(n2)

  while n1_level > n2_level
    n1 = n1.parent
    n1_level -= 1
  end

  while n2_level > n1_level
    n2 = n2.parent
    n2_level -= 1
  end
  return n1 if n1 == n2
  ancestor(n1, n2)
end

def ancestor(n1, n2)
  (n1.parent != n2.parent) ? ancestor(n1.parent, n2.parent) : n2.parent
end



def get_node_level(n1, i = 1)
  n1.parent.nil? ? i : get_node_level(n1.parent, i+1)
end

Node = Struct.new(:name ,:parent, :left, :right)

root = Node.new("a")
root2 = Node.new("j")

childb = Node.new("b", root)
childc = Node.new("c", root)
childh = Node.new("h", root2)

childe = Node.new("e", childc )
childf = Node.new("f", childc )
childd = Node.new("d", childb)

childb.right = childd
childc.right = childe
childc.left = childf
root.right = childb
root.left = childc
root2.right = childh


# for e and d CCA is a 
puts closest_common_ancestor(childe, childd)

# for e and f CCA is c 
puts closest_common_ancestor(childe, childf)


# for e and c CCA is c 
puts closest_common_ancestor(childe, childc)

# for h and d CCA is null 
puts closest_common_ancestor(childh, childd)

