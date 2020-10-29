class PolyTreeNode
    attr_reader :value, :parent, :children 

    def initialize(value) 
        @value = value 
        @parent =  nil 
        @children = [] 
    end 
    #node  = root beause the parent is empty

    def parent=(new_parent) 
        
        return if new_parent == @parent
            
            
        if @parent != nil #if this is not a root, it has parent
            @parent.children.delete(self)   #delete the relation from parent
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
        # root = arr.first
        # left = arr[1..-1]{|ele| ele < root}
        # right = arr[1..-1]{|ele| ele >= root}
        self.children.each do |child|  #child is node
            search_result = child.dfs(target) # a.dfs(c) 
            return search_result if !search_result.nil?
        end 
        nil 
    end 

    def bfs(target = nil) #FIFO => c
        # self.children.each do |child| #child is a node

            # return self if self.value == target #if root is the target
            # self.children.each do |child|
            #     until self.children.empty? #this is where we stop Infinite loop
            #      ele = self.children.shift #check the fisrt ele if not take out, 
                 
            #      ele.children.each {|child| self.children << child}
            #     end 
                    # if child.value == target
                    # return child.value
                # else
                #     child.children.each do |child|
                #     end
                    #this goes on forever, we need to stop it
            # end
            # if child.children.empty?
            #     search_result = nil 
            # else
            #     ele = child.children.shift
            #     ele == target
            # end
        # end 
        nodes = [self]  
        until nodes.empty?
            node = nodes.shift #first node in nodes
            return node if node.value == target
            nodes.concat(node.children)
        end
        nil
    end
    #root: node => self 
    

# for this question if arr # not all cases
    #        a
    #   b         c
    #  2        4   5
end


# node1 = PolyTreeNode.new("root") #parent = nil, children = [node2, node3]
# node2 = PolyTreeNode.new("child1")  #parent = node1, children = []

