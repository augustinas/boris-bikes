require 'docking_station'
require 'capybara/rspec'

feature 'member of the public docks bike' do
  scenario 'docking station unable to receive as full' do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { docking_station.dock Bike.new }
    expect { docking_station.dock Bike.new }.to raise_error 'Station Full'
  end
  scenario 'capacity can be increased when needed' do
    docking_station = DockingStation.new
    docking_station.capacity = 50
    expect { 50.times { docking_station.dock Bike.new } }.not_to raise_error
  end
end
