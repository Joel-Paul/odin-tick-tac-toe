
class Board
  SIZE = 3
  
  EMPTY = ' '
  X = 'X'
  O = 'O'

  def initialize
    @board = Array.new(SIZE, EMPTY) { Array.new(SIZE, EMPTY) }
  end

  private

  def print_board
    puts "   |   |   \n"
    puts @board.map { |row| " #{row.join(' | ')} " }.join("\n___|___|___\n   |   |   \n")
    puts "   |   |   \n"
  end
end

board = Board.new
board.print_board
