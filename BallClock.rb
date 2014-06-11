# Justin Berger
class BallClock
  
  def initialize(num)
    @Max = num
    @Hours = Array.new
    @FiveMinutes = Array.new
    @OneMinutes = Array.new
    @Balls = (1..num).to_a
  end
  
  def to_a
    Array.new(@Balls)
  end
  
  def Step
    nextBall = @Balls.shift
    if (@OneMinutes.length >= 4)
      @Balls.concat(@OneMinutes.reverse)
      @OneMinutes = Array.new
      if (@FiveMinutes.length >= 11)
        @Balls.concat(@FiveMinutes.reverse)
        @FiveMinutes = Array.new
        if (@Hours.length >= 11)
          @Balls.concat(@Hours.reverse)
          @Hours = Array.new
          @Balls << nextBall
        else
          @Hours << nextBall
        end
      else
        @FiveMinutes << nextBall
      end
    else
      @OneMinutes << nextBall
    end
  end
  
  def self.Simulate(num)
    clock = BallClock.new(num)
    d0 = clock.to_a
    #day 1
    (60*24).times { |x| clock.Step }
    d1 = clock.to_a
    #day 2...
    pattern = Array.new(d1)
    newer = d1
    iter = 1
    while (newer != d0)
      old = newer
      newer = Array.new(num)
      (old.length).times { |i|
        slot = pattern[i-1]
        ball = old[slot-1]
        newer[i-1] = ball
      }
      #puts 1+x
      #print newer
      #puts "\n"
      iter += 1
    end
    if (newer == d0)
      puts "WINNER!!!!"
      puts iter
    end
  end
end