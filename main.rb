def gameplay()
  positions = [[1,2,3],[4,5,6],[7,8,9]]
  last_player = "X"
  current_player = "O"
  win = false
  
  puts "Let's play Tic Tac Toe!"

  # Display board:
  puts "
  #{positions[0][0]} | #{positions[0][1]} | #{positions[0][2]}
  __|___|____
  #{positions[1][0]} | #{positions[1][1]} | #{positions[1][2]}
  __|___|____
  #{positions[2][0]} | #{positions[2][1]} | #{positions[2][2]}
    |   | 
  "

  until win == true
    # Get input:
    puts "Player #{current_player}, please select a position"
    input = gets.chomp.to_i
    row = (input - 1) / 3
    col = (input - 1) % 3

    if positions.flatten.include?(input) && input.integer?
      positions[row][col] = current_player

      case last_player
      when "X"
        last_player = "O"
        current_player = "X"
      when "O"
        last_player = "X"
        current_player = "O"
      end
    else
      puts "Please select an available number"
    end

    # Update board:
    puts "
    #{positions[0][0]} | #{positions[0][1]} | #{positions[0][2]}
    __|___|____
    #{positions[1][0]} | #{positions[1][1]} | #{positions[1][2]}
    __|___|____
    #{positions[2][0]} | #{positions[2][1]} | #{positions[2][2]}
      |   | 
    "
    
    #Check if win:
    diag_one = [positions[0][0], positions[1][1], positions[2][2]]
    diag_two = [positions[0][2], positions[1][1], positions[2][0]]
    vert_one = [positions[0][0], positions[1][0], positions[2][0]]
    vert_two = [positions[0][0], positions[1][0], positions[2][0]]
    vert_three = [positions[0][0], positions[1][0], positions[2][0]]


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
    #Debugging
    puts "Win?: #{win}"
    puts "Diag_one: #{diag_one}"
    puts "Diag_two: #{diag_two}"
  end

  puts "Congratulations player #{last_player}, you won!"

end

gameplay()

