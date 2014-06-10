# Justin Berger
require './BallClock.rb'
class Tester
  def Test
    clock = BallClock.new(30)
    puts clock.inspect
    #1 day
    (60*24).times { |x| clock.Step }
    puts clock.inspect
  end
end

t = Tester.new
t.Test

