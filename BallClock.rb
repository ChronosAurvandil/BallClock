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
end