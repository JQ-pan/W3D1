class Array
    def my_each(&blk)
        i = 0
        while i < self.length
            blk.call(self[i])
            i += 1
        end
        self
    end
end

[1,2,3].my_each{|num| puts num}