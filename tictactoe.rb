# frozen_string_literal: true

# Displays the board and handles game logic.
class Board
  attr_reader :current_player

  EMPTY = ' '
  PLAYER_1 = 'X'
  PLAYER_2 = 'O'

  def initialize
    @board = Array.new(3, EMPTY) { Array.new(3, EMPTY) }
    @current_player = 1
  end

  def game_over?
    won = @board.any? { |row| same_markers?(row) }
    won ||= @board.transpose.any? { |row| same_markers?(row) }
    won || game_over_diagonal?
  end

  def place_marker(x_pos, y_pos)
    @board[y_pos][x_pos] = @current_player == 1 ? PLAYER_1 : PLAYER_2
    @current_player = @current_player % 2 + 1 unless game_over?
  end

  def print_board
    puts "   |   |   \n"
    puts @board.map { |row| " #{row.join(' | ')} " }.join("\n___|___|___\n   |   |   \n")
    puts "   |   |   \n"
  end

  private

  def game_over_diagonal?
    diagonals = Array.new(2)
    diagonals[0] = (0..2).map { |i| @board[i][i] }
    diagonals[1] = (0..2).map { |i| @board[i][2 - i] }

    diagonals.any? { |row| same_markers?(row) }
  end

  def same_markers?(row)
    row.uniq.length == 1 && row[0] != EMPTY
  end
end

# Handles player input.
class Game
  def initialize
    @board = Board.new
  end

  def play
    @board.print_board

    until @board.game_over?
      @board.place_marker(*process_input)
      @board.print_board
    end
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
