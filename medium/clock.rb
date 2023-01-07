class Clock
  attr_accessor :time, :hour, :minute

  def initialize(hour, minute=0)
    @time = time_string(hour.to_s, minute.to_s)
    @hour = hour
    @minute = minute
  end

  def time_string(hour, minute)
    hour = '0' + hour if hour.length == 1
    minute = '0' + minute if minute.length == 1
    hour + ':' + minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def to_s
    self.time
  end

  def +(new_minutes)
    new_minutes = minute + new_minutes
    new_hour = hour

    loop do
      break if new_minutes < 60
      new_minutes -= 60
      new_hour += 1
    end

    loop do
      break if new_hour < 24
      new_hour -= 24
    end

    Clock.new(new_hour, new_minutes)
  end

  def -(new_minutes)
    new_minutes = minute - new_minutes
    new_hour = hour

    loop do
      break if new_minutes >= 0
      new_minutes += 60
      new_hour -= 1
    end

    loop do
      break if new_hour >= 0
      new_hour += 24
    end

    Clock.new(new_hour, new_minutes)
  end

  def ==(other)
    time == other.time
  end
end

puts Clock.new("12", "55").time