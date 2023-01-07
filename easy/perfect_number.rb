class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1
    aliquot_sum = self.divisors(num).inject(:+)
    if aliquot_sum > num
      'abundant'
    elsif aliquot_sum < num
      'deficient'
    else
      'perfect'
    end
  end

  private

  def self.divisors(num)
    arr = []
    (1...num).to_a.each { |x| arr << x if num % x == 0 }
    arr
  end
end