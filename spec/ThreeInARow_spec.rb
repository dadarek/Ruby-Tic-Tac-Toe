require 'ThreeInARow'

describe ThreeInARow do
  before(:each) do
    @row = ThreeInARow.new
  end
  it "knows that it's empty" do
    row = ThreeInARow.new
    row.isEmpty.should == true
  end
  it "knows that it's not empty" do
    row = ThreeInARow.new
    row.take(5, "x")
    row.isEmpty.should == false
  end
  it "knows if a player can win with one move" do
    row = ThreeInARow.new
    row.take(4, "x")
    row.take(6, "x")
    row.canPlayerWinWithOneMove("x").should == true
  end
  it "knows a player can't win with one move" do
    row = ThreeInARow.new
    row.take(4, "x")
    row.canPlayerWinWithOneMove("x").should == false
  end
  it "knows a player can't win with one move if opponent is on a square" do
    row = ThreeInARow.new
    row.take(4, "x")
    row.take(5, "o")
    row.canPlayerWinWithOneMove("x").should == false
  end
  it "knows a player can't win with one move if his opponent has the third square" do
    row = ThreeInARow.new
    row.take(1, "x")
    row.take(2, "x")
    row.take(3, "o")
    row.canPlayerWinWithOneMove("x").should == false
  end
  it "knows a player can win with two moves" do
    row = ThreeInARow.new
    row.take(4, "x")
    row.canPlayerWinWithTwoMoves("x").should == true
  end
  it "knows a player can't win with two moves if he has no squares" do
    row = ThreeInARow.new
    row.canPlayerWinWithTwoMoves("x").should == false
  end
  it "knows a player can't win with two moves if his opponent has one square" do
    row = ThreeInARow.new
    row.take(1, "x")
    row.take(3, "o")
    row.canPlayerWinWithTwoMoves("x").should == false
  end
  it "knows a player can win with any number of moves" do
    row = ThreeInARow.new
    row.canPlayerWinWithAnyNumberOfMoves("x").should == true
  end
  it "knows a player can't win with any number of moves after opponent took one" do
    row = ThreeInARow.new
    row.take(5, "x")
    row.canPlayerWinWithAnyNumberOfMoves("y").should == false
  end
end

