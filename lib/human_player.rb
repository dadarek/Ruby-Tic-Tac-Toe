class HumanPlayer
  def initialize(prompter)
    @prompter = prompter
  end

  def next_move
    @prompter.get_square
  end

  def to_s
    "You"
  end
end
