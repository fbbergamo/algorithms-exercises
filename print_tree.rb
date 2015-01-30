
# |    a     |   j
# |   / \    |  /
# |  b   c   | h
# | /   / \  |
# |d   e   f |

Node = Struct.new(:name ,:parent, :left, :right)
$new_line = Node.new("\n")

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


def print_tree(root)
  queue = Queue.new
  queue << root
  queue << $new_line
  current_level = -1
  level = 0
  print_node(root, queue)
  print "\n"
end

def print_node(node, queue)
  node = queue.pop
  if node == $new_line
    print node.name

    node = queue.pop
    queue << $new_line unless queue.empty?
  end
  print(" #{node.name}") if node
  queue << node.right if node.right
  queue << node.left if node.left
  if node.right
    print_node(node.right, queue)
  end
  if node.left
    print_node(node.left, queue)
  end


end

print_tree(root)
puts ""
print_tree(root2)