# Justin Berger
require './BallClock.rb'
class Tester
  
  def initialize
    @Clock = BallClock.new(30)
  end
  def TestDay
    clock = BallClock.new(30)
    d0 = clock.to_a
    print d0
    puts clock.inspect
    #day 1
    (60*24).times { |x| clock.Step }
    d1 = clock.to_a
    puts clock.inspect
    #day 2...
    pattern = Array.new(d1)
    old = d1
    newer = Array.new(30)
    
    14.times { |x|
      (old.length).times { |i|
        slot = pattern[i-1]
        ball = old[slot-1]
        newer[i-1] = ball
      }
      puts 1+x
      print newer
      puts "\n"
      old = newer
      if (newer == d0)
        puts "WINNER!!!!"
      end
      newer = Array.new(30)
    }
  end
  def TestSim
    BallClock.Simulate(30)
    BallClock.Simulate(45)
  end
end

t = Tester.new
t.TestSim

