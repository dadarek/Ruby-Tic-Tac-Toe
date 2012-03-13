class StreamBoardPrinter
  def initialize(stream)
    @stream = stream
  end

  def print(board)
    @stream.puts(" | | \n")
  end
end
