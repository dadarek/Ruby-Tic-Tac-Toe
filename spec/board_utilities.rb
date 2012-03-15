def take_x_o(board, x_squares, o_squares)
  take(board, "x", x_squares)
  take(board, "o", o_squares)
end

def take(board, player, squares)
  squares.each{ |square| board.take(square, player) }
end

