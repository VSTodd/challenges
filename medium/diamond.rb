class Diamond
  def self.make_diamond(char)
    return "A\n" if char == 'A'
    @spaces_key = make_spaces
    spaces = @spaces_key[char]
    a_line = make_a_line(spaces)
    top = make_top(char, spaces)
    bottom = make_bottom(char, spaces)
    a_line + top + bottom + a_line
  end

  class << self
  private

    def make_a_line(spaces)
      a_spaces = (spaces + 2)/2
      (" " * a_spaces) + "A" + (" " * a_spaces) + "\n"
    end

    def make_top(char, spaces)
      array = ('B'..char).to_a
      top = ""
      array.each do |current_char|
        char_value = @spaces_key[current_char]
        ext_space = " " * ((spaces-char_value)/2)
        top << (ext_space + current_char + (" " * char_value) + current_char + ext_space + "\n")
      end
      top
    end

    def make_bottom(char, spaces)
      array = ('B'..char).to_a
      array.pop
      bottom = ""
      array.reverse.each do |current_char|
        char_value = @spaces_key[current_char]
        ext_space = " " * ((spaces-char_value)/2)
        bottom << (ext_space + current_char + (" " * char_value) + current_char + ext_space + "\n")
      end
      bottom
    end

    def make_spaces
      hash = Hash.new
      value = 1
      ('B'..'Z').to_a.each do |char|
        hash[char] = value
        value += 2
      end
      hash
    end
  end
end
