require_relative 'station'

class Oystercard

  attr_accessor :balance
  attr_reader :deduct, :journey_history, :journey
  

  MAX_CAP = 90
  MIN_CHARGE = 1


  def initialize
    @balance = 0
    @journey = {}
    @journey_history = []
  end

  def top_up(money)
    fail "Maximum limit of #{MAX_CAP} reached" if (@balance + money) > MAX_CAP
    @balance += money
  end

  def touch_in(station)
    fail "insufficent funds" if @balance < MIN_CHARGE
    @journey[:entrance_station] = station
  end

  def in_journey?
    @journey.any?
  end

  def touch_out(station)
    deduct(MIN_CHARGE)
    @journey[:exit_station] = station
    @journey_history << @journey
    @journey = {}
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
