require 'heuristic'
require 'board'

describe Heuristic do
  before(:each) do
    @board = Board.new
    @heuristic = Heuristic.new(@board, "x", "o")
  end

  it "takes the winning move" do
    take_x_o_and_assert([1, 2], [], 3)
  end

  it "takes the winning move (diagonal)" do
    take_x_o_and_assert([1, 9], [], 5)
  end

  it "blocks opponents winning move" do
    take_x_o_and_assert([], [4, 5], 6)
  end

  it "blocks opponents winning move (diagonal)" do
    take_x_o_and_assert([], [3, 7], 5)
  end

  it "forks when possible (case 1)" do
    take_x_o_and_assert([1, 7], [9, 4], 3)
  end

  it "forks when possible (case 2)" do
    take_x_o_and_assert([1, 3], [7, 2], 9)
  end

  it "blocks possible fork on second move" do
    take([1, 9], "o")
    @board.take(5, "x")

    @heuristic.nextMove().should satisfy{ |square| [2, 4, 6, 8].include? square }
  end

  it "blocks fork when opponents first move is edge" do
    take([8, 1], "o")
    @board.take(5, "x")
    @heuristic.nextMove().should satisfy{ |square| [4, 7, 9].include? square }
  end

  it "takes the center if open" do
    take_x_o_and_assert([9], [4], 5)
  end

  it "makes the correct first move (any corner)" do
    @heuristic.nextMove().should satisfy{ |square| [1,3,7,9].include? square }
  end

  it "takes the last square (2)" do
    take_x_o_and_assert([3, 4, 8, 9], [1, 5, 6, 7], 2)
  end

  it "takes the last square (8)" do
    take_x_o_and_assert([1, 2, 6, 7], [3, 4, 5, 9], 8)
  end

  it "takes the last square (4)" do
    take_x_o_and_assert([1, 3, 6, 8], [2, 5, 7, 9], 4)
  end

  it "takes the last square (6)" do
    take_x_o_and_assert([2, 4, 7, 9], [1, 3, 5, 8], 6)
  end

  def take_x_o_and_assert(x_squares, o_squares, expectedMove)
    take(x_squares, "x")
    take(o_squares, "o")
    @heuristic.nextMove.should == expectedMove
  end

  def take(squares, player)
    squares.each{ |square| @board.take(square, player) }
  end

end

