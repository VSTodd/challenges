class Anagram
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def match(comparisons)
    comparisons.select do |comparison|
      next if word.downcase == comparison.downcase
      next if word.length != comparison.length
      comparison.chars.all? do |char|
        word.downcase.count(char) == comparison.downcase.count(char)
      end
    end
  end
end