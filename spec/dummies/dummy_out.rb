class DummyOut
  attr_accessor :buffer

  def initialize
    @buffer = ""
  end

  def printf(s)
    @buffer << s
  end
end
