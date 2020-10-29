require_relative "PolyTreeNode" 
require "set" 

class KnightPathFinder
    attr_reader :start_pos, :considered_positions, :root_node 

    def initialize(start_pos)
        @start_pos = start_pos # [row,col] 
        @root_node = PolyTreeNode.new(@start_pos) 
        #the starting pos is the root of a tree
        @considered_positions = [start_pos]
    end 
    #kpf = KnightPathFinder.new([0, 0])
    CONSTANT_POS = [
        [2,1],
        [2,-1],
        [-2,1],
        [-2,-1],
        [1,2],
        [1,-2],
        [-1,2],
        [-1,-2]
    ]
    def self.valid_moves(pos) #[0,0]
        row , col = pos #row =0 , col = 0
        range = [0,1,2,3,4,5,6,7] 

        valid_positions = []
      CONSTANT_POS.each do |x,y| #[2,1]
        new_position = [row + x, col + y] #[0+2, 0+1] => [2,1] 
        new_row, new_col = new_position # 2, 1
        valid_positions << new_position if range.include?(new_row)  && range.include?(new_col) #
      end 

      return valid_positions 
    end

     def new_move_positions(pos)
        #should call the valid_moves class method
        #filter out any positions that are already in @considered_positions
        #add remaning new pos to @considered_positions
        #return new pos
        valid_poss = self.class.valid_moves(pos) #node children [v_p, v_p] 
        
        new_pos = []
        valid_poss.each do |v_p| 
            if !@considered_positions.include?(v_p)  
                new_pos << v_p  #if not already considered , we add to new pos
                @considered_positions << v_p  #if not already considered, we add to condered
            end 
        end 
        new_pos
        # 1.get all valid position!
        # 2.take out @considered_positions
        #3. add remaining new_position to @considered_positions
        #4. return new_pos
    end

    def build_move_tree
        queue = [@root_node]
        
        
        until queue.empty? 
            node = queue.shift
            positions = new_move_positions(node.value)
            positions.each do |child_pos| 
                child = PolyTreeNode.new(child_pos) 
                node.add_child(child)
                queue << child
            end 
        end 
        # node = queue.shift
        #poss = new_move_pos(start pos)
        #pos => make it into a node
        # node.value = one_position
        #iterate through poss
        
    end 

    def find_path(end_pos) # find paths to end positions, include the begining pos
        #use either dfs or bfs to search => this return the tree node instance containg end_pos
        #bfs/dfs gives us a node. we need a path
        end_node = @root_node.bfs(end_pos)
        trace_path_back(end_node)#returns arr of nodes from end to start
            .reverse
            .map(&:value)
        #end node == end_pos in node form
        
    end 
    #kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]

    def trace_path_back(end_node) #trace back from the node to root use PolyTreeNode#parent
       #we need to start with tree node and trace back to the root
       #node => parent, parent => parent, parent => root

        arr = []
        current = end_node  #set a current
        until current.nil? #we hit the root
            arr << current.parent # put parent into arr
            current = current.parent #change current to the privious parent, now parent is a child
        end 
        arr #return all parents
    end
end 

# k = KnightPathFinder.new([7,7])  
#  KnightPathFinder.valid_moves(k.start_pos)  
# k.new_move_positions([7,7])
# now [5,6]  should not have [7,7 ] in it?

# k.new_move_positions([7,7])
# k.new_move_positions([5,6])
# k.new_move_positions([7,5])
# k.new_move_positions([6,5])

# p k.build_move_tree

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
