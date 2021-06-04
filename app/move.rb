# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
# TODO: Use the information in board to decide your next move.
SNAKE_NAME = "Local-Snake-Ngrok"
GAME_LIMIT = 300

$dest = [0,0]
$games = Hash.new(0)

def move(board)
  # possible_moves = ["up", "down", "left", "right"]
  head = [board[:you][:head][:x], board[:you][:head][:y]]
  height = board[:board][:height]
  width = board[:board][:width]
  game = board[:game][:id]
  $games[game] += 1
  if $games[game] > GAME_LIMIT
    return "up"
  end

  
  getDest(head, height, width)

  move = moveTo($dest, head)
  puts "MOVE: " + move

  { "move": move }

end

def getDest(head, height, width)
  puts "The current head location is #{head}"
  if head == [0, 0]
    $dest = [width - 1, 0]
  elsif head == [width - 1, 0]
    $dest = [width - 1, height - 1]
  elsif head == [width - 1, height - 1]
    $dest = [0, height - 1]
  elsif head == [0, height - 1]
    $dest = [0, 0]
  end
  
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
