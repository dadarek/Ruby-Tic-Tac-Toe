require 'heuristic'
require 'board'

describe Heuristic do
  before(:each) do
    @board = Board.new("x", "o")
    @heuristic = Heuristic.new
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

  it "forks when possible (1)" do
    take_x_o_and_assert([1, 7], [9, 4], 3)
  end

  it "forks when possible (2)" do
    take_x_o_and_assert([1, 3], [7, 2], 9)
  end

  it "forks when possible (3)" do
    take_x_o_and_assert([7, 9], [3, 8], 1)
  end

  it "forks when possible (4)" do
    take_x_o_and_assert([3, 9], [1, 6], 7)
  end

  it "blocks blocks two-corner fork (1)" do
    take_x_o_and_satisfy([5], [1, 9], [2, 4, 6, 8])
  end

  it "blocks blocks two-corner fork (2)" do
    take_x_o_and_satisfy([5], [3, 7], [2, 4, 6, 8])
  end

  it "blocks one-edge one-corner fork (1)" do
    take_x_o_and_assert([5], [8, 1], 4)
  end

  it "blocks one-edge one-corner fork (2)" do
    take_x_o_and_assert([5], [2, 9], 6)
  end

  it "blocks one-edge one-corner fork (3)" do
    take_x_o_and_assert([5], [6, 7], 8)
  end

  it "blocks one-edge one-corner fork (4)" do
    take_x_o_and_assert([5], [3, 4], 2)
  end

  it "takes the center if open" do
    take_x_o_and_assert([9], [4], 5)
  end

  it "makes the correct first move (any corner)" do
    take_x_o_and_satisfy([], [], [1, 3, 7, 9])
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

  it "takes the last square (1)" do
    take_x_o_and_assert([3, 4, 5, 8], [2, 6, 7, 9], 1)
  end

  it "takes the last square (3)" do
    take_x_o_and_assert([2, 4, 5, 9], [1, 6, 7, 8], 3)
  end

  it "takes the last square (7)" do
    take_x_o_and_assert([1, 5, 6, 8], [2, 3, 4, 9], 7)
  end

  it "takes the last square (9)" do
    take_x_o_and_assert([2, 5, 6, 7], [1, 3, 4, 8], 9)
  end

  it "takes corner when first is square" do
    take_x_o_and_satisfy([], [5], [1, 3, 7, 9])
  end

  def take_x_o_and_assert(x_squares, o_squares, expected_move)
    take(x_squares, "x")
    take(o_squares, "o")
    @heuristic.next_move(@board, "x").should == expected_move
  end

  def take_x_o_and_satisfy(x_squares, o_squares, possible_squares)
    take(x_squares, "x")
    take(o_squares, "o")
    @heuristic.next_move(@board, "x").should satisfy{ |square| possible_squares.include? square }
  end

  def take(squares, player)
    squares.each{ |square| @board.take(square, player) }
  end

end

