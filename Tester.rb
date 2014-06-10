# Justin Berger
require './BallClock.rb'
class Tester
  def Test
    clock = BallClock.new(30)
    puts clock.inspect
    #puts clock.to_a
    (60*24).times do |x|
      clock.Step
    end
    puts clock.inspect
    #puts clock.to_a
  end
end

t = Tester.new
t.Test

