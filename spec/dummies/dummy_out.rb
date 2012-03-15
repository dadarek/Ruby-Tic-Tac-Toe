class DummyOut
  attr_reader :times_prompted_for_square, :times_prompted_to_play_again, :times_prompted_to_play_first

  def initialize
    @times_prompted_for_square = 0
    @times_prompted_to_play_again = 0
    @times_prompted_to_play_first = 0
  end

  def prompt_for_square
    @times_prompted_for_square += 1
  end

  def prompt_to_play_again
    @times_prompted_to_play_again += 1
  end

  def prompt_to_play_first
    @times_prompted_to_play_first += 1
  end
end
