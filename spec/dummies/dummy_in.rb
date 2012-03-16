class DummyIn
  attr_accessor :buffer

  def initialize
    buffer = ""
  end

  def gets
    buffer.shift
  end
end
