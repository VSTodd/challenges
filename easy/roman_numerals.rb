class RomanNumeral
  def initialize(num)
    @arabic_num = num
  end

  def to_roman
    key = {1 => 'IVX', 2 => 'XLC', 3 => 'CDM', 4 => 'M__'}
    roman_num = ''
    length = @arabic_num.to_s.length
    @arabic_num.to_s.chars.map(&:to_i).each do |num|
      roman_num << interpreter(num, key[length])
      length -= 1
    end
    roman_num
  end

  def interpreter(num, key)
    case num
    when 1..3 then key[0] * num
    when 4    then key[0] + key[1]
    when 5    then key[1]
    when 6..8 then key[1] + (key[0] * (num - 5))
    when 9    then key[0] + key[2]
    when 0    then ""
    end
  end
end