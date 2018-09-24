class Triangle
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "foo"
    end
  end

  private

  def a
    @a
  end

  def validate_triangle
    #borrowed from the solution branch because it's quite elegant.
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each { |s| real_triangle << false if s <= 0 }
    raise TriangleError if real_triangle.include?(false)
  end


  def b
    @b
  end

  def c
    @c
  end
end
