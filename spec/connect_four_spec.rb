require("/lib/connect_four")

let

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
      expect(subject.valid_input("four")).to eq(false)
    end

    it "out of range input is rejected - 1" do
      expect(subject.valid_input?(9)).to eq(false)
    end

    it "out of range input is rejected - 2" do
      expect(subject.valid_input?(-1)).to eq(false)
    end

    it "entry to full column is rejected" do
      let(:full_board){Connect_Four.new("full")}
      expect(full_board.valid_input(2)).to eq(false)
    end

    it "symbol falls to bottom of column" do
      let(:empty_board){Connect_Four.new()}
      expect(empty_board.place("X", 2)).to change(empty_board.last)
    end

    it "players take turns - odd turn" do
      expect(subject.to_play(1)).to eq("X")
    end

    it "players take turns - even turn" do
      expect(subject.to_play(10)).to eq("O")
    end
  end

  describe "check win conditions" do
    it "check horizontal" do
      let(:game){Connect_Four.new}
      game.place("X", 0)
      game.place("X", 1)
      game.place("X", 2)
      game.place("X", 3)
      expect(game.check_winner).to eq("X")
    end

    it "check vertical" do
      let(:game){Connect_Four.new}
      game.place("O", 0)
      game.place("O", 0)
      game.place("O", 0)
      game.place("O", 0)
      expect(game.check_winner).to eq("O")
    end

    it "check diagonal" do
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
    it "check for draw" do
      let(:draw_game){Connect_Four.new("draw")}
      expect(draw_game.find_winner).to eq("draw")
    end

    it "displays winner" do
      let(:x_wins){Connect_Four.new("x_wins")}
      expect(draw_game.find_winner).to eq("X")
    end
  end
end