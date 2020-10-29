class PolyTreeNode  # starting position
    attr_reader :value, :parent, :children 

    def initialize(value)
        @value = value 
        @parent =  nil  
        @children = [] #posible moves 
        #each child is one posible move
    end 

    def parent=(new_parent) 
        
        return if new_parent == @parent
            
            
        if @parent != nil #if this is not a root, it has parent
            @parent.children.delete(self)   #delete the reation from parent
            @parent = new_parent #change to new parent
            new_parent.children << self if new_parent != nil#add self into new tree
            #instance of this class 
        else   #if it is a root, does not have a parent
            @parent = new_parent
            new_parent.children << self if new_parent != nil
           
        end 
    end 


    def add_child(child_node)
        child_node.parent = self
    end
    #tree.remove_child(child) 
    def remove_child(child_node)

        raise "error" if !self.children.include?(child_node) 
        child_node.parent = nil 
    end 

    def dfs(target) #LIFO
        return nil if self.nil? 
        return self if self.value == target 
    
        self.children.each do |child|  #child is node
            search_result = child.dfs(target) # a.dfs(c) 
            return search_result if !search_result.nil?
        end 
        nil 
    end 

    def bfs(target) 
         queue = [self]
         until queue.empty?
            node = queue.shift
            return node if node.value == target 
            queue.concat(node.children)
            # queue.children.each {|child| queue << child }
         end
         nil 
    end 
end