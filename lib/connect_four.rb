class Connect_Four
  def initialize(preset = "empty")
    @board = Array.new(6){Array.new(7){"-"}}
    @turns = 0

    if preset == "all_x"
      @board = Array.new(6){Array.new(7){"X"}}
    end

    if preset == "draw"
      @board = [["X","X","O","O","X","X","O"],
                ["O","O","X","X","O","O","X"],
                ["X","X","O","O","X","X","O"],
                ["O","O","X","X","O","O","X"],
                ["X","X","O","O","X","X","O"],
                ["O","O","X","X","O","O","X"],]
    end
  end
  
  attr_accessor :board

  def valid_input?(input)
    #to_i maps strings to 0, so just check that input.to_i is in range
    return input.to_i.between?(1,7)
  end

  def valid_place?(column)
    return @board[0][column] == "-"
  end

  def place(symbol, column)
    row_to_edit = 0
    5.downto(0) do |row|
      if @board[row][column] == "-"
        row_to_edit = row
        break
      end
    end
    @board[row_to_edit][column] = symbol
    @turns += 1
  end

  def to_play(turn = @turns + 1)
    if turn % 2 == 0
      return "O"
    else
      return "X"
    end
  end

  def return_board
    return @board
  end
end