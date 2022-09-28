
class Board
  SIZE = 3

  EMPTY = ' '
  X = 'X'
  O = 'O'

  def initialize
    @board = Array.new(SIZE, EMPTY) { Array.new(SIZE, EMPTY) }
    print_board
  end

  def p1_place(x, y)
    place_marker(X, x, y)
  end

  def p2_place(x, y)
    place_marker(O, x, y)
  end

  def print_board
    puts "   |   |   \n"
    puts @board.map { |row| " #{row.join(' | ')} " }.join("\n___|___|___\n   |   |   \n")
    puts "   |   |   \n"
  end

  private

  def place_marker(marker, x, y)
    @board[y][x] = marker
    print_board
  end
end

board = Board.new
board.p1_place(0, 0)
board.p2_place(1, 0)
