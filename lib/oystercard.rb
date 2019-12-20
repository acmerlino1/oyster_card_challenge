require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_accessor :balance
  attr_reader :deduct, :journey
  

  MAX_CAP = 90
  MIN_LIMIT = 1


  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
  end

  def top_up(money)
    fail "Maximum limit of #{MAX_CAP} reached" if (@balance + money) > MAX_CAP
    @balance += money
  end

  def touch_in(station = nil)
    fail "insufficent funds" if @balance < MIN_LIMIT
    # penalty fare?
    journey.set_entry(station)
  end

  def touch_out(station = nil)
    journey.set_exit(station)
    deduct(journey.fare)
    journey.reset
  end
  
  private

  def deduct(fare)
    @balance -= fare
  end

end
