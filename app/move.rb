# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
# TODO: Use the information in board to decide your next move.
SNAKE_NAME = "Local-Snake-Ngrok"

def move(board)
  localBoard = board[:board]
  puts "This is a list of Snek"
  height = localBoard[:height]
  width = localBoard[:width]
  location = {}
  localBoard[:snakes].each { |snek|
    puts "Snake Name: " + snek[:name]
    if snek[:name] == SNAKE_NAME
      puts "This is the correct snake"
      head = snek[:head]
      location = head
      puts "The current head height is #{head[:y]}"
      puts "The current head width is #{head[:x]}"
    end
  }
  # Choose a random direction to move in
  possible_moves = ["up", "down", "left", "right"]
  move = possible_moves.sample
  if move == "down"
    if location[:y] == 0
      move = "up"
      puts "Changed direction up"
    end
  end
  if move =="up"
    if location[:y] == height - 1
      move = "down"
      puts "Changed direction down"
    end
  end

  if move =="right"
    if location[:x] == width - 1
      move = "left"
      puts "Changed direction left"
    end
  end

  if move =="left"
    if location[:x] == 0
      move = "right"
      puts "Changed direction right"
    end
  end



  puts "MOVE: " + move
  { "move": move }
end
