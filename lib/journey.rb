class Journey

  MIN_CHARGE = 1
  PENALTY_FARE = 6

  attr_reader :journey, :history, :entry_station, :exit_station

  def initialize
    @history = []
    @entry_station = nil
    @exit_station = nil
  end

  def set_entry(station)
    @entry_station = station
  end

  def set_exit(station)
    @exit_station = station
  end

  def fare
    @entry_station == nil || @exit_station == nil ? PENALTY_FARE : MIN_CHARGE 
  end

  def record
    @history << {:entrance_station => @entry_station,:exit_station => @exit_station}
  end

  def reset
    @entry_station = nil
    @exit_station = nil
  end
end