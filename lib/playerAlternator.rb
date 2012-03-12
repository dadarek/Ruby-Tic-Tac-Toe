class PlayerAlternator
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
  end

  def next
    @last = (@p1 == @last ? @p2 : @p1)
  end

end
