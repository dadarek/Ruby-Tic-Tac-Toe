class HumanPlayer
  def initialize(prompter)
    @prompter = prompter
  end

  def nextMove
    @prompter.get_square
  end

  def to_s
    "You!"
  end
end
