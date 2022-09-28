class Board
  attr_reader :current_player

  EMPTY = ' '
  X = 'X'
  O = 'O'

  def initialize
    @board = Array.new(3, EMPTY) { Array.new(3, EMPTY) }
    @current_player = 1
    print_board
  end

  def game_over?
    false
  end

  def print_board
    puts "   |   |   \n"
    puts @board.map { |row| " #{row.join(' | ')} " }.join("\n___|___|___\n   |   |   \n")
    puts "   |   |   \n"
  end

  def place_marker(x_pos, y_pos)
    @board[y_pos][x_pos] = @current_player == 1 ? X : O
    @current_player = @current_player % 2 + 1
    print_board
  end
end

class Game
  def initialize
    @board = Board.new
  end

  def play
    @board.place_marker(*process_input) until @board.game_over?
  end

  def process_input
    puts "Player #{@board.current_player}'s turn!"
    puts 'Enter the x and y position you wish to place your marker:'
    input = gets.chomp.split
    until valid_input?(input)
      puts 'Invalid coordinates. Please try again:'
      input = gets.chomp.split
    end
    input.map(&:to_i)
  end

  def valid_input?(input)
    !input.nil? && input.length == 2 && input.all? { |e| e.to_i.to_s == e && e.to_i.between?(0, 2) }
  end
end

game = Game.new
game.play
