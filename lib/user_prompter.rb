class UserPrompter
  def initialize(reader, writer)
    @reader = reader
    @writer = writer
  end

  def get_square
    @writer.prompt_for_square
    square = @reader.read_square
    return square if (1..9).include? square
    get_square
  end

  def get_play_again
    @writer.prompt_to_play_again
    play_again = @reader.play_again
    return play_again if [true, false].include? play_again
    get_play_again
  end 

end
