require 'journey'

describe Journey do

  let(:oystercard) { double :oystercard }
  let(:station) { double :station}
  
  it 'should be an empty journey before journey' do
    expect(subject.history).to be_empty
  end

  it 'should save entrance and exit station' do
    subject.set_entry(station)
    subject.set_exit(station)
    subject.record
    expect(subject.history).not_to be_empty
  end
  
  it 'should return minimum fare for complete journey' do
    subject.set_entry(station)
    subject.set_exit(station)
    expect(subject.fare).to eq Journey::MIN_CHARGE
  end

  it 'should return 6 for incomplete journey' do
    subject.set_entry(station)
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end
end