require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
  let(:holder) { ContainerHolder.new }

  it 'should accept a bike' do
    expect(holder.bike_count).to eq(0)
    holder.dock(double :bike)
    expect(holder.bike_count).to eq(1)
  end

  it 'raises error when no bikes available' do
    expect { holder.release_bike }.to raise_error 'No Bikes Available'
  end

  it 'raises an error when full' do
    holder.capacity.times { holder.dock double :bike }
    expect { holder.dock double :bike }.to raise_error 'Station Full'
  end

  # ------------------------------------------

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

  it 'capacity can be set' do
    expect(subject).to respond_to :capacity=
  end

  it 'does not raises error if capacity not reached' do
    subject.capacity = 50
    expect { 45.times { subject.dock double :bike } }.not_to raise_error
  end
end
