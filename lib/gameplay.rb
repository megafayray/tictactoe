class GamePlay # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  def play
    positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    last_player = 'X'
    current_player = 'O'
    win = false

    talking = Dialogue.new
    talking.hello

    game_board = GameBoard.new(positions)
    game_board.display

    until win == true
      talking.prompt_to_select_position(current_player)
      input = gets.chomp.to_i

      if positions.flatten.include?(input) && input.integer?
        game_board.update(input, current_player)
        game_board.display
        last_player, current_player = current_player, last_player
      else
        talking.try_again
      end

      win = true if check_win(positions)
    end

    talking.winner_message(last_player)
  end

  def check_win(positions)
    diag_one = [positions[0][0], positions[1][1], positions[2][2]]
    diag_two = [positions[0][2], positions[1][1], positions[2][0]]
    vert_one = [positions[0][0], positions[1][0], positions[2][0]]
    vert_two = [positions[0][1], positions[1][1], positions[2][1]]
    vert_three = [positions[0][2], positions[1][2], positions[2][2]]

    winning_combinations = [
      positions[0], positions[1], positions[2],
      vert_one, vert_two, vert_three, diag_one, diag_two
    ]
    winning_combinations.any? { |combination| combination.uniq.size == 1 && combination.first.is_a?(String) }
  end
end
