class DummyPrompter
  attr_accessor :times_to_play, :times_play_again_asked, :moves

  def initialize
    @times_play_again_asked = 0
  end

  def play_again?
    @times_play_again_asked += 1
    @times_to_play > @times_play_again_asked
  end

  def get_square
    @moves.shift
  end
end
