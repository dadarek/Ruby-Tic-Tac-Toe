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
  
end
