class DummyStream
  attr_accessor :what_printed
  def initialize
    @what_printed = ""
  end

  def printf(s)
    @what_printed << s 
  end
end
