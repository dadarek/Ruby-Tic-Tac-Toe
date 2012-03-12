class UserPrompter
  def initialize(in_stream, out_stream)
    @in_stream = in_stream
    @out_stream = out_stream
  end

  def get_square
    @out_stream.prompt_for_square
    @in_stream.read_square
  end
  
end
