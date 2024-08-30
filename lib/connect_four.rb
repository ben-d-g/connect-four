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

  def return_board
    return @board
  end
end