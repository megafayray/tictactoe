#spec/tictactoe_spec.rb
require './main.rb'

describe GamePlay do
  describe "#check_win(positions)" do
    it "returns false when no win conditions are met" do
      gameplay = GamePlay.new
      positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      expect(gameplay.check_win(positions)).to be false
    end

    it "returns true for a winning horizontal row" do
      gameplay = GamePlay.new
      positions = [["X", "X", "X"], [4, 5, 6], [7, 8, 9]]
      expect(gameplay.check_win(positions)).to be true
    end

    it "returns true for a winning vertical row" do
      gameplay = GamePlay.new
      positions = [["O", 2, 3], ["O", 5, 6], ["O", 8, 9]]
      expect(gameplay.check_win(positions)).to be true
    end
  end

  describe "#update(input, player)" do
    it "updates positions" do
      positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      game_board = GameBoard.new(positions)
      game_board.update(1, "X")
      expect(positions).to eql([["X", 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  describe "#play" do
    it "runs one loop, updates the board, and announces the winner" do
      dialogue = double("Dialogue")
      game_board = double("GameBoard")

      #allow these methods to be called without doing anything:
      allow(dialogue).to receive(:hello)
      allow(dialogue).to receive(:prompt_to_select_position)
      allow(dialogue).to receive(:try_again)
      allow(dialogue).to receive(:winner_message)

      allow(game_board).to receive(:display)
      allow(game_board).to receive(:update)
      # Stub input so it doesn't wait for user interaction
      allow_any_instance_of(Object).to receive(:gets).and_return("1")

      # Create the GamePlay instance using the doubles
      gameplay = GamePlay.new(dialogue, game_board)

      # Stub check_win so it returns true immediately to exit the loop
      allow(gameplay).to receive(:check_win).and_return(true)

      # Act
      gameplay.play
      # Assertions
      expect(dialogue).to have_received(:hello)
      expect(dialogue).to have_received(:prompt_to_select_position).with("O")
      expect(game_board).to have_received(:update).with(1, "O")
      expect(dialogue).to have_received(:winner_message).with("O")
    end
  end
end