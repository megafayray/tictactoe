class GameBoard
  def initialize(positions)
    @positions = positions
  end
  
  def display 
    puts "
    #{@positions[0][0]} | #{@positions[0][1]} | #{@positions[0][2]}
    __|___|____
    #{@positions[1][0]} | #{@positions[1][1]} | #{@positions[1][2]}
    __|___|____
    #{@positions[2][0]} | #{@positions[2][1]} | #{@positions[2][2]}
      |   | 
    "
  end
  def update(input, player)
    row = (input - 1) / 3
    col = (input - 1) % 3
    @positions[row][col] = player
  end
end

###############################################

class Dialogue
  def hello
    puts "Let's play Tic Tac Toe!"
  end
  def prompt_to_select_position(current_player)
    puts "Player #{current_player}, please select a position"
  end
  def try_again
    puts "Please select an available number"
  end
  def winner_message(last_player)
    puts "Congratulations player #{last_player}, you won!"
  end
end

###############################################

def gameplay()
  positions = [[1,2,3],[4,5,6],[7,8,9]]
  last_player = "X"
  current_player = "O"
  win = false
  
  talking = Dialogue.new
  talking.hello

  game_board = GameBoard.new(positions)
  game_board.display

  until win == true
    # Get input:
    talking.prompt_to_select_position(current_player)
    input = gets.chomp.to_i

    if positions.flatten.include?(input) && input.integer?
      game_board.update(input, current_player)
      game_board.display
      last_player, current_player = current_player, last_player
    else
      talking.try_again
    end
    
    #Check if win:
    diag_one = [positions[0][0], positions[1][1], positions[2][2]]
    diag_two = [positions[0][2], positions[1][1], positions[2][0]]
    vert_one = [positions[0][0], positions[1][0], positions[2][0]]
    vert_two = [positions[0][1], positions[1][1], positions[2][1]]
    vert_three = [positions[0][2], positions[1][2], positions[2][2]]


    if positions[0].all? { |item| item == "X" || item == "O" } ||
        positions[1].all? { |item| item == "X" || item == "O" } ||
        positions[2].all? { |item| item == "X" || item == "O" } ||
        diag_one.all? { |item| item == "X" || item == "O" } ||
        diag_two.all? { |item| item == "X" || item == "O" } ||
        vert_one.all? { |item| item == "X" || item == "O" } ||
        vert_two.all? { |item| item == "X" || item == "O" } ||
        vert_three.all? { |item| item == "X" || item == "O" }
      win = true
    end
  end

  talking.winner_message(last_player)
end

gameplay()