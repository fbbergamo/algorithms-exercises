#You are at latest version of committed code.  assume one branch of code. Code version is in sorted order. 
#It is corrupted with bug. You have fun isBug(VerNumber) which returns True or False. Find the version in which bug was introduced?

#mock helpers methods code 20 is when the bugs started  
# 1 2 .. 5 .. 10 .. 20 .. 30
# 15  -> no 
# 23 -> yes
# 15 - 23 
# 19 -> no
# 21 -> yes
# 20 -> yes

#mock helpers methods code 20 is when the bugs started  
# 1 2 .. 5 .. 10 .. 19 .. 31
# 16  -> no 
# 24 -> yes
# 20 -> yes
# 18 -> no 
# 19 -> no 


def bug?(version)
  version >= 20 ? true : false
end

def find_bugs(versions)
  if versions.size == 1 or versions.nil? or !bug?(versions[versions.size - 1])
    return -1
  end
  return versions[0] if bug?(versions[0])
  return binary_search(versions, 0, versions.size - 1)

end

def binary_search(versions, start, ended)
  return versions[ended] if (ended - start == 1 )
  middle = (start+ended)/2
  puts middle
  if bug?(versions[middle])
    binary_search(versions, start, middle)
  else
    binary_search(versions,  middle, ended)
  end
end

puts "Erro branch 0..30 #{find_bugs((0..30).to_a)}"
puts "Erro branch 0..31 #{find_bugs((0..31).to_a)}"
puts "Erro branch 0..1 #{find_bugs((0..1).to_a)}"
puts "Erro branch 0..20 #{find_bugs((0..20).to_a)}"
puts "Erro branch 0..21 #{find_bugs((0..21).to_a)}"
puts "Erro branch 10..21 #{find_bugs((10..21).to_a)}"
puts "Erro branch 20..21 #{find_bugs((20..21).to_a)}"


#puts find_bugs((0..31).to_a)