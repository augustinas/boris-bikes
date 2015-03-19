require 'docking_station'

describe DockingStation do
  # it { is_expected.to respond_to :release_bike }
  # it 'releases bikes that are not broken' do
  #   bike = subject.release_bike
  #   expect(bike).not_to be_broken
  # end
  it 'does not release broken bikes' do
    broken_bike = double :bike, broken?: true
    subject.dock broken_bike
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end

  it 'releases bikes that are not broken' do
    subject.dock double :bike, broken?: false
    bike = subject.release_bike
    expect(bike).not_to be_broken
  end
  # it { is_expected.to respond_to :dock }
  it 'can dock a bike' do
    expect(subject.dock :bike).to be nil
  end

  it 'raises error when no bikes available' do
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end

  it 'raises an error when full' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock double :bike }
    expect { subject.dock double :bike }.to raise_error 'Station Full'
  end

  it 'capacity can be set' do
    expect(subject).to respond_to :capacity=
  end

  it 'does not raises error if capacity not reached' do
    subject.capacity = 50
    expect { 45.times { subject.dock double :bike } }.not_to raise_error
  end
end
