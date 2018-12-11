
class Empty
    def intersectTo f
        self
    end

    def intersectToPoints v
        Empty.new
    end

    def intersectToRay v
        Empty.new
    end

    def intersectToSegment v
        Empty.new
    end
end

# Implement classes
class Points
    def initialize array
        @points = array
    end
    
    def intersectTo f
        f.intersectToPoints self
    end

    # add more methods

end

class Segment
     
end

class Ray
    
end
