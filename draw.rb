require 'launchpad'

interaction = Launchpad::Interaction.new

flags = Hash.new(false)

# yellow feedback for grid buttons
interaction.response_to(:grid, :down) do |interaction, action|
  coord = 16 * action[:y] + action[:x]
  puts "PRESSED: Y #{action[:y]}, X #{action[:x]}"
  brightness = flags[coord] ? :off : :hi
  flags[coord] = !flags[coord]
  interaction.device.change(:grid, action.merge( :green => brightness))
  interaction.device.change :grid, :x => (action[:x] + 1), :y => (action[:y] + 1), :red => :high, :green => :low
end

# mixer button terminates interaction on button up
interaction.response_to(:mixer) do |interaction, action|
  interaction.device.change(:mixer, :red => action[:state] == :down ? :hi : :off)
  interaction.stop if action[:state] == :up
end

interaction.device.change :grid, :x => 4, :y => 4, :red => :high, :green => :low

# start interacting
interaction.start

# sleep so that the messages can be sent before the program terminates
sleep 0.1

