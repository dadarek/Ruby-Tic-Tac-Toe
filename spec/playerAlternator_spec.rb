require 'playerAlternator'

describe PlayerAlternator do
  
  it "alternates players" do
    createAndAlternate("x", "y")
  end

  it "alternates other objects as well" do
    createAndAlternate(1, {})
  end

  def createAndAlternate(o1, o2)
    alternator = PlayerAlternator.new(o1, o2)
    alternator.next.should == o1
    alternator.next.should == o2
    alternator.next.should == o1
    alternator.next.should == o2
    alternator.next.should == o1
    alternator.next.should == o2
  end

end
