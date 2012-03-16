class DummyIn
  attr_writer :read_square_responses, :play_again_responses, :play_first_responses
  attr_accessor :buffer

  def initialize
    buffer = ""
  end

  def read_square
    @read_square_responses.shift
  end

  def play_again?
    @play_again_responses.shift
  end

  def play_first?
    @play_first_responses.shift
  end

  def gets
    buffer.shift
  end
end
