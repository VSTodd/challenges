class DNA
  def initialize(dna_strand)
    @dna_strand = dna_strand
  end

  def hamming_distance(new_strand)
    distance = 0
    @dna_strand.chars.each_index do |index|
      break if new_strand[index] == nil
      distance += 1 if @dna_strand[index] != new_strand[index]
    end
    distance
  end
end