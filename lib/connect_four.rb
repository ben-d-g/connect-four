# frozen_string_literal: true

class Connect_Four
  def initialize(preset = 'empty')
    @board = Array.new(6) { Array.new(7) { '-' } }
    @turns = 0

    @board = Array.new(6) { Array.new(7) { 'X' } } if preset == 'all_x'

    return unless preset == 'draw'

    @board = [%w[X X O O X X O],
              %w[O O X X O O X],
              %w[X X O O X X O],
              %w[O O X X O O X],
              %w[X X O O X X O],
              %w[O O X X O O X]]
  end

  attr_accessor :board

  def play
    while find_winner.nil?
      print_board
      puts("Enter column for #{to_play} >>")
      move_input = gets.chomp
      until valid_input?(move_input) && valid_place?(move_input.to_i - 1)
        puts('Invalid entry')
        move_input = gets.chomp
      end
      place(to_play, move_input.to_i - 1)
    end
    print_board
    if find_winner == 'draw'
      puts("It's a draw!")
    else
      puts("Player #{find_winner} wins!")
    end
  end

  def print_board
    puts
    @board.each do |row|
      puts(row.join)
    end
  end

  def valid_input?(input)
    # to_i maps strings to 0, so just check that input.to_i is in range
    input.to_i.between?(1, 7)
  end

  def valid_place?(column)
    @board[0][column] == '-'
  end

  def place(symbol, column)
    row_to_edit = 0
    5.downto(0) do |row|
      if @board[row][column] == '-'
        row_to_edit = row
        break
      end
    end
    @board[row_to_edit][column] = symbol
    @turns += 1
  end

  def to_play(turn = @turns + 1)
    if turn.even?
      'O'
    else
      'X'
    end
  end

  def find_winner
    return check_rows if check_rows
    return check_cols if check_cols

    return check_diagonals if check_diagonals

    return if @board.flatten.include?('-')

    'draw'
  end

  def check_rows
    0.upto(5) do |row|
      0.upto(3) do |col|
        if (@board[row][col] != '-') && (@board[row][col] == @board[row][col + 1]) && (@board[row][col] == @board[row][col + 2]) && (@board[row][col] == @board[row][col + 3])
          return @board[row][col]
        end
      end
    end
    nil
  end

  def check_cols
    0.upto(2) do |row|
      0.upto(6) do |col|
        if (@board[row][col] != '-') && (@board[row][col] == @board[row + 1][col]) && (@board[row][col] == @board[row + 2][col]) && (@board[row][col] == @board[row + 3][col])
          return @board[row][col]
        end
      end
    end
    nil
  end

  def check_diagonals
    0.upto(2) do |row|
      0.upto(3) do |col|
        if !@board[row][col].nil? && @board[row][col] != '-' && @board[row][col] == @board[row + 1][col + 1] && @board[row][col] == @board[row + 2][col + 2] && @board[row][col] == @board[row + 3][col + 3]
          return @board[row][col]
        end
      end
    end

    3.upto(5) do |row|
      0.upto(3) do |col|
        if !@board[row][col].nil? && @board[row][col] != '-' && @board[row][col] == @board[row - 1][col + 1] && @board[row][col] == @board[row - 2][col + 2] && @board[row][col] == @board[row - 3][col + 3]
          return @board[row][col]
        end
      end
    end

    nil
  end

  def return_board
    @board
  end
end
