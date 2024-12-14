class Dialogue # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  def hello
    puts "Let's play Tic Tac Toe!"
  end

  def prompt_to_select_position(current_player)
    puts "Player #{current_player}, please select a position"
  end

  def try_again
    puts 'Please select an available number'
  end

  def winner_message(last_player)
    puts "Congratulations player #{last_player}, you won!"
  end
end
