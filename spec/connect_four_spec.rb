require("connect_four")

describe Connect_Four do
  describe "initialise" do
    it "initialises board" do
      expect(subject.return_board).to_not eq(nil)
    end

    it "initialises board with empty cells" do
      expect(subject.return_board).to eq(Array.new(6){Array.new(7){"-"}})
    end
  end

  describe "player moves" do
    it "in range input is accepted" do
      expect(subject.valid_input?(4)).to eq(true)
    end

    it "string input is rejected" do
      expect(subject.valid_input?("four")).to eq(false)
    end

    it "out of range input is rejected - 1" do
      expect(subject.valid_input?(9)).to eq(false)
    end

    it "out of range input is rejected - 2" do
      expect(subject.valid_input?(-1)).to eq(false)
    end

    it "entry to non-full column is accepted" do
      #full_board = Connect_Four.new("all_x")
      expect(subject.valid_place?(2)).to eq(true)
    end

    it "entry to full column is rejected" do
      full_board = Connect_Four.new("all_x")
      expect(full_board.valid_place?(2)).to eq(false)
    end

    xit "symbol falls to bottom of column" do
      let(:empty_board){Connect_Four.new()}
      expect(empty_board.place("X", 2)).to change(empty_board.last)
    end

    xit "players take turns - odd turn" do
      expect(subject.to_play(1)).to eq("X")
    end

    xit "players take turns - even turn" do
      expect(subject.to_play(10)).to eq("O")
    end
  end

  describe "check win conditions" do
    xit "check horizontal" do
      let(:game){Connect_Four.new}
      game.place("X", 0)
      game.place("X", 1)
      game.place("X", 2)
      game.place("X", 3)
      expect(game.check_winner).to eq("X")
    end

    xit "check vertical" do
      let(:game){Connect_Four.new}
      game.place("O", 0)
      game.place("O", 0)
      game.place("O", 0)
      game.place("O", 0)
      expect(game.check_winner).to eq("O")
    end

    xit "check diagonal" do
      let(:game){Connect_Four.new}
      game.place("O", 0)
      game.place("X", 1)
      game.place("O", 1)
      game.place("X", 2)
      game.place("X", 2)
      game.place("O", 0)
      game.place("X", 3)
      game.place("X", 3)
      game.place("X", 3)
      game.place("O", 0)
      expect(game.check_winner).to eq("O")
    end
  end

  describe "end of game" do
    xit "check for draw" do
      let(:draw_game){Connect_Four.new("draw")}
      expect(draw_game.find_winner).to eq("draw")
    end

    xit "displays winner" do
      let(:x_wins){Connect_Four.new("all_x")}
      expect(draw_game.find_winner).to eq("X")
    end
  end
end