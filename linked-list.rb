class Node
  attr_accessor :value, :nextNode
  def initialize(value=nil,nextNode=nil)
    @value = value
    @nextNode = nextNode
  end
end
class LinkedList
  attr_accessor :nodes, :count
  def initialize
    @nodes = []
    @count = 0
  end
  def append(value)
    @nodes << Node.new(value)
    @count += 1
    @nodes[-2].nextNode = @nodes[-1] if @count > 1
  end
  def prepend(value)
    @nodes.insert(0,Node.new(value))
    @nodes[0].nextNode = @nodes[1]
    @count += 1
  end
  def size
    @count
  end
  def head
    @nodes[0]
  end
  def tail
    @nodes[-1]
  end
  def at(index)
    @nodes[index]
  end
  def pop
    @nodes.pop
    @nodes[-1].nextNode = nil
    @count -= 1
  end
  def insert_at(index, value)
    @nodes.insert(index,Node.new(value))
    @nodes[index].nextNode = @nodes[index+1]
    @nodes[index-1].nextNode = @nodes[index]
    @count += 1
  end
  def remove_at(index)
    @nodes.delete_at(index)
    @nodes[index-1].nextNode = @nodes[index]
    @count -= 1
  end
  def contains?(value)
    i=0
    contain = false
    while i < @count
      if value == @nodes[i].value
        contain = true
        break
      end
      i += 1
    end
    contain
  end
  def find(data)
    i=0
    location = nil
    while i < @count
      if data == @nodes[i].value
        location = i
        break
      end
      i += 1
    end
    location
  end
  def to_s
    listString = ""
    @nodes.each {|x| listString << "(#{x.value}) -> "}
    listString << "nil"
  end
end

my_list = LinkedList.new
my_list.append(50)
my_list.append(100)
my_list.append(3)
my_list.prepend(25)
my_list.insert_at(1,37)
print my_list.nodes, "\n"
my_list.nodes.each {|node| puts node.value; puts node.nextNode}
puts my_list.size
my_list.remove_at(1)
print my_list.nodes, "\n"
puts my_list.at(1)
my_list.pop
print my_list.nodes, "\n"
puts my_list.size
puts my_list.contains?(50)
puts my_list.find(50)
puts my_list.to_s
