require 'launchpad'

interaction = Launchpad::Interaction.new

flags = Hash.new(false)

def draw_dot(interaction, action)
  interaction.device.change :grid, :x => (action[:x]), :y => (action[:y]), :green => :high
end

def draw_cross(interaction, action)
  randomness_red = rand(10) # generate a random number
  if (randomness_red % 2) == 1 # (if the random number is odd)
    red = :high
  else
    red = :low
  end

  randomness_green = rand(10) # generate a random number
  if (randomness_green % 2) == 1 # (if the random number is odd)
    green = :high
  else
    green = :low
  end
  interaction.device.change :grid, :x => (action[:x] + 1), :y => (action[:y]), :red => red, :green => green
  interaction.device.change :grid, :x => (action[:x] - 1), :y => (action[:y]), :red => red, :green => green
  interaction.device.change :grid, :x => (action[:x]), :y => (action[:y]), :red => red, :green => green
  interaction.device.change :grid, :x => (action[:x]), :y => (action[:y] + 1), :red => red, :green => green
  interaction.device.change :grid, :x => (action[:x]), :y => (action[:y] - 1), :red => red, :green => green
end
# yellow feedback for grid buttons
interaction.response_to(:grid, :down) do |interaction, action|
  coord = 16 * action[:y] + action[:x]
  brightness = flags[coord] ? :off : :hi
  flags[coord] = !flags[coord]

  puts "PRESSED: Y #{action[:y]}, X #{action[:x]}"

  randomness_red = rand(10) # generate a random number
  if (randomness_red % 2) == 1 # (if the random number is odd)
    draw_cross(interaction, action)
  else
    draw_dot(interaction, action)
  end
  #interaction.device.change :grid, :x => (action[:x] + 1), :y => (action[:y]), :red => red, :green => green
  #interaction.device.change :grid, :x => (action[:x] - 1), :y => (action[:y]), :red => red, :green => green
  #interaction.device.change :grid, :x => (action[:x]), :y => (action[:y]), :red => red, :green => green
  #interaction.device.change :grid, :x => (action[:x]), :y => (action[:y] + 1), :red => red, :green => green
  #interaction.device.change :grid, :x => (action[:x]), :y => (action[:y] - 1), :red => red, :green => green
end

# mixer button terminates interaction on button up
interaction.response_to(:mixer) do |interaction, action|
  interaction.device.change(:mixer, :red => action[:state] == :down ? :hi : :off)
  interaction.stop if action[:state] == :up
end

#while true do
 # 8.times do |index|
   # sleep 0.5
    #randomness_red = rand(1..3) # generate a random number
    #if randomness_red == 1 # (if the random number is odd)
     # red = :off
   # elsif randomness_red == 2
   #   red = :low
   # else
    #  red = :high
   # end

  #  randomness_green = rand(1..3) # generate a random number
   # if randomness_green == 1 # (if the random number is odd)
    #  green = :off
   # else
    #  green = :high
   # end
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 0, :red => :off, :green => :low
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 0, :red => :off, :green => :low
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 0, :red => :off, :green => :low
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 0, :red => :off, :green => :low
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 0, :red => :off, :green => :low
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 0, :red => :off, :green => :low
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 0, :red => :off, :green => :low
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 0, :red => :off, :green => :low
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 1, :red => :off, :green => :off
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 2, :red => red, :green => green
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 3, :red => :off, :green => green
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 4, :red => red, :green => green
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 5, :red => red, :green => green
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 6, :red => red, :green => green
     # interaction.device.change :grid, :x => (index - 1) + 1, :y => 7, :red => red, :green => green
 # end
#end

while true do
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 6, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 6, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 7, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 7, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 7, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
  end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 6, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 6, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 7, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 7, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 7, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
  end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 6, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 6, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
  end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :low
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :low
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :low
   end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
   end
  # START ORANGE
  # START ORANGE
  # START ORANGE
  # START ORANGE
  # START ORANGE
  # START ORANGE
  # START ORANGE
  # START ORANGE
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 6, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 6, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 7, :red => :low, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 7, :red => :low, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 7, :red => :low, :green => :low
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
  end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 6, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 6, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 7, :red => :high, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 7, :red => :high, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 6, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 7, :red => :high, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
  end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 6, :red => :low, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 6, :red => :low, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 6, :red => :low, :green => :low
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
  end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 6, :red => :high, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 6, :red => :high, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
  end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :low, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :low, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :low, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :low, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :low, :green => :low
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
  end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 5, :red => :high, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 5, :red => :high, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 6, :y => 5, :red => :high, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 5, :red => :high, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 4, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => 2, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
  end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 1, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 6, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 1, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :low, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :low, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 2, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :low, :green => :low
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :low, :green => :low
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 5, :y => 2, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 3, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 7, :y => 1, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
  end
  1.times do |a|
    sleep 0.05
#rain
    interaction.device.change :grid, :x => 0, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 1, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 6, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 1, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :high, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 4, :red => :high, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 1, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 1, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 2, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 3, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 2, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :high, :green => :high
    sleep 0.1
    interaction.device.change :grid, :x => 2, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 6, :y => 4, :red => :high, :green => :high
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 4, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 5, :y => 2, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 1, :red => :off, :green => :off
    interaction.device.change :grid, :x => 2, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 3, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 7, :y => 0, :red => :off, :green => :off
    sleep 0.05
    interaction.device.change :grid, :x => 0, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :high, :green => :off
    sleep 0.1
    interaction.device.change :grid, :x => 0, :y => 2, :red => :off, :green => :off
    interaction.device.change :grid, :x => 1, :y => 0, :red => :off, :green => :off
    interaction.device.change :grid, :x => 3, :y => 3, :red => :off, :green => :off
    interaction.device.change :grid, :x => 5, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => 7, :y => 1, :red => :off, :green => :off
  end
#scrolling sheets of color
 # 8.times do |b|
    sleep 0.1

    interaction.device.change :grid, :x => (b - 1) + 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => (b - 1) + 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => (b - 1) + 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => (b - 1) + 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => (b - 1) + 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => (b - 1) + 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => (b - 1) + 1, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => (b - 1) + 1, :y => 7, :red => :off, :green => :high
 # end
 # 8.times do |c|
   sleep 0.1

    interaction.device.change :grid, :x => (c - 1) + 1, :y => 0, :red => :low, :green => :high
    interaction.device.change :grid, :x => (c - 1) + 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => (c - 1) + 1, :y => 2, :red => :high, :green => :high
    interaction.device.change :grid, :x => (c - 1) + 1, :y => 3, :red => :low, :green => :high
    interaction.device.change :grid, :x => (c - 1) + 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => (c - 1) + 1, :y => 5, :red => :low, :green => :high
    interaction.device.change :grid, :x => (c - 1) + 1, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => (c - 1) + 1, :y => 7, :red => :low, :green => :high
 # end

  #8.times do |d|
    sleep 0.1

    interaction.device.change :grid, :x => (d - 1) + 1, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => (d - 1) + 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => (d - 1) + 1, :y => 2, :red => :high, :green => :high
    interaction.device.change :grid, :x => (d - 1) + 1, :y => 3, :red => :high, :green => :high
    interaction.device.change :grid, :x => (d - 1) + 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => (d - 1) + 1, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => (d - 1) + 1, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => (d - 1) + 1, :y => 7, :red => :off, :green => :high
 # end

  #8.times do |e|
    sleep 0.1

    interaction.device.change :grid, :x => (e - 1) + 1, :y => 0, :red => :high, :green => :low
    interaction.device.change :grid, :x => (e - 1) + 1, :y => 1, :red => :high, :green => :high
    interaction.device.change :grid, :x => (e - 1) + 1, :y => 2, :red => :high, :green => :low
    interaction.device.change :grid, :x => (e - 1) + 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => (e - 1) + 1, :y => 4, :red => :low, :green => :low
    interaction.device.change :grid, :x => (e - 1) + 1, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => (e - 1) + 1, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => (e - 1) + 1, :y => 7, :red => :off, :green => :off
 # end
  #8.times do |f|
    sleep 0.1

    interaction.device.change :grid, :x => (f - 1) + 1, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => (f - 1) + 1, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => (f - 1) + 1, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => (f - 1) + 1, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => (f - 1) + 1, :y => 4, :red => :high, :green => :off
    interaction.device.change :grid, :x => (f - 1) + 1, :y => 5, :red => :high, :green => :off
    interaction.device.change :grid, :x => (f - 1) + 1, :y => 6, :red => :high, :green => :off
    interaction.device.change :grid, :x => (f - 1) + 1, :y => 7, :red => :high, :green => :off
 # end

  #8.times do |g|
    sleep 0.1

    interaction.device.change :grid, :x => (g - 1) + 1, :y => 0, :red => :off, :green => :low
    interaction.device.change :grid, :x => (g - 1) + 1, :y => 1, :red => :off, :green => :low
    interaction.device.change :grid, :x => (g - 1) + 1, :y => 2, :red => :off, :green => :low
    interaction.device.change :grid, :x => (g - 1) + 1, :y => 3, :red => :off, :green => :low
    interaction.device.change :grid, :x => (g - 1) + 1, :y => 4, :red => :off, :green => :low
    interaction.device.change :grid, :x => (g - 1) + 1, :y => 5, :red => :off, :green => :low
    interaction.device.change :grid, :x => (g - 1) + 1, :y => 6, :red => :off, :green => :low
    interaction.device.change :grid, :x => (g - 1) + 1, :y => 7, :red => :off, :green => :low
 # end

  #8.times do |h|
    sleep 0.1

    interaction.device.change :grid, :x => (h - 1) + 1, :y => 0, :red => :off, :green => :high
    interaction.device.change :grid, :x => (h - 1) + 1, :y => 1, :red => :off, :green => :high
    interaction.device.change :grid, :x => (h - 1) + 1, :y => 2, :red => :off, :green => :high
    interaction.device.change :grid, :x => (h - 1) + 1, :y => 3, :red => :off, :green => :high
    interaction.device.change :grid, :x => (h - 1) + 1, :y => 4, :red => :off, :green => :high
    interaction.device.change :grid, :x => (h - 1) + 1, :y => 5, :red => :off, :green => :high
    interaction.device.change :grid, :x => (h - 1) + 1, :y => 6, :red => :off, :green => :high
    interaction.device.change :grid, :x => (h - 1) + 1, :y => 7, :red => :off, :green => :high
 # end
  #8.times do |i|
    sleep 0.1

    interaction.device.change :grid, :x => (i - 1) + 1, :y => 0, :red => :low, :green => :high
    interaction.device.change :grid, :x => (i - 1) + 1, :y => 1, :red => :low, :green => :high
    interaction.device.change :grid, :x => (i - 1) + 1, :y => 2, :red => :low, :green => :high
    interaction.device.change :grid, :x => (i - 1) + 1, :y => 3, :red => :low, :green => :high
    interaction.device.change :grid, :x => (i - 1) + 1, :y => 4, :red => :low, :green => :high
    interaction.device.change :grid, :x => (i - 1) + 1, :y => 5, :red => :low, :green => :high
    interaction.device.change :grid, :x => (i - 1) + 1, :y => 6, :red => :low, :green => :high
    interaction.device.change :grid, :x => (i - 1) + 1, :y => 7, :red => :low, :green => :high
 # end

  #8.times do |j|
    sleep 0.1

    interaction.device.change :grid, :x => (j - 1) + 1, :y => 0, :red => :high, :green => :high
    interaction.device.change :grid, :x => (j - 1) + 1, :y => 1, :red => :high, :green => :high
    interaction.device.change :grid, :x => (j - 1) + 1, :y => 2, :red => :high, :green => :high
    interaction.device.change :grid, :x => (j - 1) + 1, :y => 3, :red => :high, :green => :high
    interaction.device.change :grid, :x => (j - 1) + 1, :y => 4, :red => :high, :green => :high
    interaction.device.change :grid, :x => (j - 1) + 1, :y => 5, :red => :high, :green => :high
    interaction.device.change :grid, :x => (j - 1) + 1, :y => 6, :red => :high, :green => :high
    interaction.device.change :grid, :x => (j - 1) + 1, :y => 7, :red => :high, :green => :high
 # end

  #8.times do |k|
    sleep 0.1

    interaction.device.change :grid, :x => (k - 1) + 1, :y => 0, :red => :high, :green => :low
    interaction.device.change :grid, :x => (k - 1) + 1, :y => 1, :red => :high, :green => :low
    interaction.device.change :grid, :x => (k - 1) + 1, :y => 2, :red => :high, :green => :low
    interaction.device.change :grid, :x => (k - 1) + 1, :y => 3, :red => :high, :green => :low
    interaction.device.change :grid, :x => (k - 1) + 1, :y => 4, :red => :high, :green => :low
    interaction.device.change :grid, :x => (k - 1) + 1, :y => 5, :red => :high, :green => :low
    interaction.device.change :grid, :x => (k - 1) + 1, :y => 6, :red => :high, :green => :low
    interaction.device.change :grid, :x => (k - 1) + 1, :y => 7, :red => :high, :green => :low
#  end
  #8.times do |l|
    sleep 0.1

    interaction.device.change :grid, :x => (l - 1) + 1, :y => 0, :red => :high, :green => :off
    interaction.device.change :grid, :x => (l - 1) + 1, :y => 1, :red => :high, :green => :off
    interaction.device.change :grid, :x => (l - 1) + 1, :y => 2, :red => :high, :green => :off
    interaction.device.change :grid, :x => (l - 1) + 1, :y => 3, :red => :high, :green => :off
    interaction.device.change :grid, :x => (l - 1) + 1, :y => 4, :red => :high, :green => :off
    interaction.device.change :grid, :x => (l - 1) + 1, :y => 5, :red => :high, :green => :off
    interaction.device.change :grid, :x => (l - 1) + 1, :y => 6, :red => :high, :green => :off
    interaction.device.change :grid, :x => (l - 1) + 1, :y => 7, :red => :high, :green => :off
 # end



end










# start interacting
interaction.start

# sleep so that the messages can be sent before the program terminates
sleep 0.1

