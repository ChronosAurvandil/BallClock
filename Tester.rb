# Justin Berger
class Tester
  def Test
    require '.\BallClock.rb'
    clock = BallClock.new
    print clock.Time
  end
end

t = Tester.new
t.Test