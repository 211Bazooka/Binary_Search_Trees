class Node
	attr_accessor :value, :left, :right, :parent

	def initialize(value, parent = nil, left = nil, right = nil)
		@value = value
		@name = parent
		@left = left
		@right = right
	end
end

class BinaryTree

	def initialize(root = nil)
		@root = root
	end

	def build_tree(arr)
		return nil unless arr.is_a?(Array) && !arr.empty?

		@root = Node.new(arr.shift)

		until arr.empty? do 
			add_node(arr.shift)
		end
	end

	def add_node(val)
		node = Node.new(val)
		current = @root
		node_placed = false

		until node_placed do
			if node.value < current.value
				if current.left
					current = current.left
				else current.left = node
					node.parent = current
					node_placed = true
				end
			else
				if current.right
					current = current.right
				else current.right = node
					node.parent = current
					node_placed = true
				end
			end
		end
	end

	def breadth_first_search(val, qlog = [@root])

		# mark A as visited
		# check left node exists
			# if exists then mark as visited
			# add to back of queue
		# check right node exists
			# if exists then mark as visited
			# add to back of queue
		# move to next Node in queue
			#repeat

		queue = [@root]

		counter = 0
		until queue.empty? do
			counter += 1
			current = queue.shift

			return puts "BFS found #{val}. Searched #{counter} nodes" if current.value == val

			if val < current.value
				if current.left
					then queue << current.left
						qlog << current.left
				end
			elsif val > current.value
				if current.right
					then queue << current.right
						qlog << current.right
				end
			end
			qlog.each {|q| puts  q.value}
		end
	end

	def depth_first_search(target)
		stack = [@root]
		counter = 0

		until stack.empty? do
			counter += 1
			current = stack.pop

			return puts "DFS found #{target}. Searched #{counter} nodes" if target == current.value 

			if target < current.value	
				then if current.left
					then stack << current.left
				end
			elsif target > current.value
				then if current.right
					then stack << current.right
				end
			end

		end

	end

	def dfs_rec(target, current = @root, counter = 0)
		counter += 1
		return puts "DFS_rec found #{target}.Searched #{counter} nodes" if target == current.value

		if target < current.value
			then if current.left
				then dfs_rec(target, current.left, counter)
			end
		elsif target > current.value
			then if current.right
				then dfs_rec(target, current.right, counter)
			end

		end

	end
end

tree = BinaryTree.new

tree.build_tree([8, 7, 4, 23, 1, 4, 3, 6, 9, 67, 6345, 324])

 tree.breadth_first_search(324)

 tree.depth_first_search(324)

 tree.dfs_rec(324)







