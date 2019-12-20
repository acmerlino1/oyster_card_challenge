require_relative 'journey'

class JourneyLog

  attr_reader :journey_class, :current_journey

  def initialize(journey_class)
    @journey_class = journey_class
    current_journey
  end

  def start(station)
    @current_journey.set_entry(station)
  end

  private

  def current_journey
    @current_journey ||= @journey_class.new
  end

end