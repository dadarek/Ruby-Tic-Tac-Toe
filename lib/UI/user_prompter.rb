class UserPrompter
  def initialize(reader=DefaultReader.new, writer=DefaultWriter.new)
    @reader = reader
    @writer = writer
  end

  def get_square
    @writer.prompt_for_square
    square = @reader.read_square.to_i
    return square if (1..9).include? square
    get_square
  end

  def play_again?
    @writer.prompt_to_play_again
    play_again = @reader.play_again?
    play_again = play_again.strip unless play_again.nil?
    return true if play_again == 'y'
    return false if play_again == 'n'
    play_again?
  end 

  def play_first?
    @writer.prompt_to_play_first
    play_first = @reader.play_first?
    play_first = play_first.strip unless play_first.nil?
    return true if play_first == 'y'
    return false if play_first == 'n'
    play_first?
  end

  class DefaultReader
    def initialize(in_stream=$stdin)
      @in_stream = in_stream
    end

    def read_square
      @in_stream.gets
    end

    def play_again?
      @in_stream.gets
    end

    def play_first?
      @in_stream.gets
    end
  end

  class DefaultWriter
    def initialize(out_stream=$stdout)
      @out_stream = out_stream
    end
    
    def prompt_for_square
      @out_stream.puts "Select a square (1-9)"
    end
    
    def prompt_to_play_again
      @out_stream.puts "Play again (y/n)?"
    end
    
    def prompt_to_play_first
      @out_stream.puts "Play first (y/n)?"
    end
  end

end
