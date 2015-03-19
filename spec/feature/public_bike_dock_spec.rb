require 'docking_station'
require 'capybara/rspec'

feature 'member of the public docks bike' do
  scenario 'docking station unable to receive as full' do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { docking_station.dock Bike.new }
    expect { docking_station.dock Bike.new }.to raise_error 'Station Full'
  end
end
