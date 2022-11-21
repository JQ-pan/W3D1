require "byebug"

class Array
    def my_each_block(&blk)

        i = 0

        while i < self.length
            blk.call(self[i])
            i += 1
        end

        self
    end

    def my_each_proc(prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end
end

arr = [1, 2, 3]
arr.my_each_block { |ele| p ele }

prc = Proc.new { |ele| p ele }
arr.my_each_proc(prc)   