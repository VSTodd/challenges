class Scrabble
  attr_reader :word, :key

  def initialize(string)
    @word = validate(string).upcase
    @key = create_key
  end

  def validate(string)
    return '' if string.class != String
    string.gsub(/[^a-z]/i, '')
  end

  def score
    score = 0
    word.chars.each { |char| score += key[char] }
    score
  end

  def self.score(string)
    self.new(string).score
  end

  def create_key
    hash = Hash.new
    'AEIOULNRST'.chars.each {|char| hash[char] = 1 }
    'DG'.chars.each {|char| hash[char] = 2 }
    'BCMP'.chars.each {|char| hash[char] = 3 }
    'FHVWY'.chars.each {|char| hash[char] = 4 }
    'K'.chars.each {|char| hash[char] = 5 }
    'JX'.chars.each {|char| hash[char] = 8 }
    'QZ'.chars.each {|char| hash[char] = 10 }
    hash
  end
end