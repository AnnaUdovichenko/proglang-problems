require "./hw5.rb"

class Testing
    def self.eval figures
        figures.inject { |result, x| result.intersectTo x }
    end
end

# Some tests are already done for you
# Do not forget to add more tests especially for corner cases

res = Testing.eval([Points.new([3, 1, 2]), Points.new([2, 3, 4])])
if not (res.is_a? Points and res.points == [2, 3])
    puts "Test1 failed!"
end

res = Testing.eval([Points.new([1]), Points.new([0])])
if not (res.is_a? Empty)
    puts "Test2 failed!"
end

res = Testing.eval([Segment.new(1, 2), Points.new([1])])
if not (res.is_a? Points and res.points == [1])
    puts "Test3 failed!"
end

res = Testing.eval([Ray.new(1, -1), Points.new([0])])
if not (res.is_a? Points and res.points == [0])
    puts "Test4 failed!"
end

res = Testing.eval([Segment.new(0, 1), Segment.new(-1, 2)])
if not (res.is_a? Segment and res.left == 0 and res.right == 1)
    puts "Test5 failed!"
end

res = Testing.eval([Segment.new(0, 1), Segment.new(1, 2)])
if not (res.is_a? Points and res.points == [1])
    puts "Test6 failed!"
end

res = Testing.eval([Segment.new(0, 1), Ray.new(-1, 1)])
if not (res.is_a? Segment and res.left == 0 and res.right == 1)
    puts "Test7 failed!"
end

res = Testing.eval([Ray.new(-1, -1), Ray.new(-1, 1)])
if not (res.is_a? Points and res.points == [-1])
    puts "Test8 failed!"
end

res = Testing.eval([Ray.new(2, -1), Ray.new(-1, 1)])
if not (res.is_a? Segment and res.left == -1 and res.right == 2)
    puts "Test9 failed!"
end
