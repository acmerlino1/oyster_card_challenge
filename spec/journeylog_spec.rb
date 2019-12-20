require 'journeylog'

describe JourneyLog do

  subject { JourneyLog.new(Journey) }
  let(:station) { double :station }
  let(:journey) { double :journey }

  
  it 'starts a new journey with an entry station' do
    expect(subject.instance_variable_get(:@current_journey)).to receive(:set_entry).with(station)
    subject.start(station)
  end
end