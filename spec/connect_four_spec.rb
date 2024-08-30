# frozen_string_literal: true

require('connect_four')

describe Connect_Four do
  describe 'initialise' do
    it 'initialises board' do
      expect(subject.return_board).to_not eq(nil)
    end

    it 'initialises board with empty cells' do
      expect(subject.return_board).to eq(Array.new(6) { Array.new(7) { '-' } })
    end
  end

  describe 'player moves' do
    it 'in range input is accepted' do
      expect(subject.valid_input?(4)).to eq(true)
    end

    it 'string input is rejected' do
      expect(subject.valid_input?('four')).to eq(false)
    end

    it 'out of range input is rejected - 1' do
      expect(subject.valid_input?(9)).to eq(false)
    end

    it 'out of range input is rejected - 2' do
      expect(subject.valid_input?(-1)).to eq(false)
    end

    it 'entry to non-full column is accepted' do
      expect(subject.valid_place?(2)).to eq(true)
    end

    it 'entry to full column is rejected' do
      full_board = Connect_Four.new('all_x')
      expect(full_board.valid_place?(2)).to eq(false)
    end

    it 'symbol falls to bottom of column - 1' do
      empty_board = Connect_Four.new
      expect { empty_board.place('X', 2) }.to change { empty_board.board[5] }.to(['-', '-', 'X', '-', '-', '-', '-'])
    end

    it 'symbol falls to bottom of column - 2' do
      empty_board = Connect_Four.new
      empty_board.place('X', 4)
      empty_board.place('O', 4)
      expect { empty_board.place('X', 4) }.to change { empty_board.board[3] }.to(['-', '-', '-', '-', 'X', '-', '-'])
    end

    it 'players take turns - odd turn' do
      expect(subject.to_play(1)).to eq('X')
    end

    it 'players take turns - even turn' do
      expect(subject.to_play(10)).to eq('O')
    end

    it 'players take turns - based on #place 1' do
      empty_board = Connect_Four.new
      expect(empty_board.to_play).to eq('X')
    end

    it 'players take turns - based on #place 2' do
      empty_board = Connect_Four.new
      empty_board.place('X', 3)
      empty_board.place('O', 5)
      empty_board.place('X', 2)
      expect(empty_board.to_play).to eq('O')
    end
  end

  describe 'check win conditions' do
    it 'check horizontal' do
      game = Connect_Four.new
      game.place('X', 0)
      game.place('X', 1)
      game.place('X', 2)
      game.place('X', 3)
      expect(game.find_winner).to eq('X')
    end

    it 'check vertical' do
      game = Connect_Four.new
      game.place('O', 0)
      game.place('O', 0)
      game.place('O', 0)
      game.place('O', 0)
      expect(game.find_winner).to eq('O')
    end

    it 'check diagonal - 1' do
      game = Connect_Four.new
      game.place('O', 0)
      game.place('X', 1)
      game.place('O', 1)
      game.place('X', 2)
      game.place('X', 2)
      game.place('O', 2)
      game.place('X', 3)
      game.place('X', 3)
      game.place('X', 3)
      game.place('O', 3)
      expect(game.find_winner).to eq('O')
    end

    it 'check diagonal - 2' do
      game = Connect_Four.new
      game.place('O', 3)
      game.place('X', 2)
      game.place('O', 2)
      game.place('X', 1)
      game.place('X', 1)
      game.place('O', 1)
      game.place('X', 0)
      game.place('X', 0)
      game.place('X', 0)
      game.place('O', 0)
      expect(game.find_winner).to eq('O')
    end
  end

  describe 'end of game' do
    it 'check for draw' do
      draw_game = Connect_Four.new('draw')
      expect(draw_game.find_winner).to eq('draw')
    end

    it 'displays winner' do
      x_wins = Connect_Four.new('all_x')
      expect(x_wins.find_winner).to eq('X')
    end
  end
end
