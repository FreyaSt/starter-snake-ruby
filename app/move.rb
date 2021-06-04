# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
# TODO: Use the information in board to decide your next move.
SNAKE_NAME = "Local-Snake-Ngrok"
dest = [0,0]


def move(board)


  # possible_moves = ["up", "down", "left", "right"]
  head = [board[:you][:head][:x], board[:you][:head][:y]]
  
  puts "The current head location is #{head}"
  if head == [0, 0]
    puts "Time to change targets"
    puts board[:board][:height] - 1
    dest = [10, 0]
    puts dest
  end
  move = moveTo(dest, head)
  puts "MOVE: " + move
  { "move": move }

end

def moveTo(dest, head)
  if head[0] > dest[0]
    return "left"
  elsif head[0] < dest[0]
    return "right"
  elsif head[1] < dest[1]
    return "up"
  elsif head[1] > dest[1]
    return "down"
  else
    return "up"
  end
end
