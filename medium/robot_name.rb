class Robot
  attr_accessor :name

  @@used_names = []

  def initialize
    @name = name_generator
    @@used_names << @name
  end

  def name_generator
    robot_name = ''
    loop do
      robot_name = ''
      2.times {robot_name << ('A'..'Z').to_a.sample }
      nums = rand(999).to_s
      2.times {nums = '0' + nums if nums.length < 3 }
      robot_name << nums
      break unless @@used_names.include? robot_name
    end
    @name = robot_name
  end

  def reset
    @name = name_generator
  end
end
