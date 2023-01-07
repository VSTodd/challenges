class Triangle
  attr_reader :sides, :equal_sides

  def initialize(a, b, c)
    @sides = [a, b, c].sort
    @equal_sides = how_many_equal
    raise ArgumentError if invalid_triangle?
  end

  def how_many_equal
    if sides[0] == sides[1] && sides[1] == sides[2] && sides[0] == sides[2]
      3
    elsif sides[0] != sides[1] && sides[1] != sides[2] && sides[0] != sides[2]
      1
    else
      2
    end
  end

  def invalid_triangle?
    sides.any? { |side| side < 0.01 } || (sides[0] + sides[1]) <= sides[2]
  end

  def kind
    if equal_sides == 3
      'equilateral'
    elsif equal_sides == 2
      'isosceles'
    else
      'scalene'
    end
  end
end