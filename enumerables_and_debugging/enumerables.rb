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

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
