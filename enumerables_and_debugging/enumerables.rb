class Array
    def my_each(&blk)
        i = 0
        while i < self.length
            blk.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&blk)
        ret_arr = []
        self.my_each { |ele| ret_arr << ele if blk.call(ele) }
        ret_arr
    end

    def my_reject(&blk)
        ret_arr = []
        self.my_each { |ele| ret_arr << ele if !blk.call(ele) }
        ret_arr
    end

    def my_any?(&blk)
        self.my_each { |ele| return true if blk.call(ele)}
        false
    end

    def my_all?(&blk)
        self.my_each { |ele| return false if !blk.call(ele)}
        true
    end



    def my_flatten
        # base case
        return [self] if !self.instance_of? Array 
        # recursive case
        ret_arr = []
        self.my_each do |ele| 
            if ele.instance_of? Array 
                ret_arr += ele.my_flatten 
            else
                ret_arr << ele 
            end
        end
        return ret_arr
    end

    def my_zip(*arg)
        arr = self.map{|el| [el]}
        i = 0
        while i < self.length
            arg.each do |smallarr|
                arr[i] << smallarr[i]
            end
            i += 1
        end
        arr
    end

    def my_rotate(n = 1)
        new_arr = self.map {|ele| ele}
        i = 0
        while i < n
            new_arr << new_arr.shift
            i += 1
        end

        while i > n
            new_arr.unshift(new_arr.pop)
            i -= 1
        end
        new_arr
    end

    def my_join(string)
        new_str = ""
        self.my_each {|ele|}
    end

end

# [1,2,3].my_each{|num| puts num}
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

#p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]