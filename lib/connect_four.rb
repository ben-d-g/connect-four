class Connect_Four
  def initialize(preset = "empty")
    @board = Array.new(6){Array.new(7){"-"}}

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

  def valid_input?(input)
    #to_i maps strings to 0, so just check that input.to_i is in range
    return input.to_i.between?(1,7)
  end

  def valid_place?(column)
    return @board[0][column] == "-"
  end

  def return_board
    return @board
  end
end