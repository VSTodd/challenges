class Octal
  attr_reader :digits

  def initialize(num)
    @digits = validate(num).chars.map(&:to_i)
  end

  def validate(num)
    num.gsub(/[^0-7]/, '') == num ? num : '0'
  end

  def to_decimal
    total = 0
    place = digits.length - 1

    digits.each do |digit|
      total += digit * (8**place)
      place -= 1
    end
    total
  end
end

# puts Octal.new('1234').to_decimal