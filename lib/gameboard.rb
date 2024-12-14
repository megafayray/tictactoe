class GameBoard # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  def initialize(positions)
    @positions = positions
  end

  def display # rubocop:disable Metrics/AbcSize
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
