
# Object, classes, methods, variables

class Hello

    def my_first_method
      puts "Hello, World!"
    end
  
  end
  
x = Hello.new
x.my_first_method

class A
    def m1
        @foo = 0
    end

    def m2 x
        @foo += x
    end

    def foo
        @foo
    end

end


# @foo is being initialized in method m1. Uncomment to get runtime error:
=begin
a = A.new
puts a.m2 42
=end


class B 
    # uses initialize method with parameters
    def initialize(f=0)
      @foo = f
    end
  
    def m2 x
      @foo += x
    end
  
    def foo
      @foo
    end
  
end

b = B.new 42
b.m2 43
puts b.foo

# Class constants and methods

class X
    X_Const = 42
end

puts "I'm a class constant: ", X::X_Const

class Y
    def self.y_class_method
        puts "I'm a class method"
    end
end

Y.y_class_method

# Getters and setters
class Foo
    def initialize x
        @foo = x
    end

    def foo
        @foo
    end
    
    def foo= x
        @foo = x
    end
end

f = Foo.new 42
f.foo = 41
puts "Value of foo: ", f.foo

class Thermo
    def initialize t = 0
        @kelvin_temp = t
    end
    attr_accessor :kelvin_temp

    def celcius_temp
        @kelvin_temp - 273.15
    end

    def celcius_temp= x
        @kelvin_temp = x + 273.15
    end
end

t = Thermo.new
puts "Temperature outdoors is %f degrees centigrade" % t.celcius_temp

# Tasks

=begin
class Point
    def initialize x, y
        # add implementation
    end

    # Do not forget about getters

    def rotate_left a
        # add implementation
    end

    def rotate_right a
        # add implementation
    end

end



# tests

class GeometryTesting
    Epsilon = 0.00001

    def self.is_close a, b
        (a - b).abs < GeometryTesting::Epsilon
    end

    def self.close_points p1, p2
        GeometryTesting::is_close p1.x, p2.x and GeometryTesting::is_close p1.y, p2.y
    end
end


p1 = Point.new 0.0, 1.0
p2 = p1.rotate_left Math::PI*2.0
p3 = Point.new -1.0, 0.0
p4 = Point.new 2.5, 1.5
p5 = Point.new 2.5, 1.5

if not GeometryTesting::close_points p1, p2
    puts "rotate_left 360 deg doesn't work"
end

if not GeometryTesting::close_points p1.rotate_left(Math::PI*0.5), p3
    puts "rotate_left 90 deg doesn't work"
end

if not GeometryTesting::close_points p5, p4.rotate_right(Math::PI).rotate_right(Math::PI)
    puts "rotate_right 180 deg twice doesn't work"
end
=end