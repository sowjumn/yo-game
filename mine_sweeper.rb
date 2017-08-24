class MineSweeper

  def generate_board(width, height, n_mines)
    @n_mines = n_mines
    @width = width
    @height = height
    @board = Array.new(height) { Array.new(width,0) }
    place_mines
    number_cells
    print_board
  end

  def number_cells
    0.upto(@height-1) do |r_i|
      0.upto(@width-1) do |c_i|
        if @board[r_i][c_i] != 'X'
          assign_mines(r_i,c_i)
        end
      end
    end
  end

  def assign_mines(r_i,c_i)
    adj = [[-1,0],[1,0],[0,1],[0,-1],[-1,-1],[1,1],[-1,1],[1,-1]]
    adj.each do |r,c|
      if (r + r_i >= 0) && (r + r_i <= @height-1) && (c + c_i >= 0) && (c + c_i <= @width-1) 
        if @board[r+r_i][c+c_i] == 'X'
          @board[r_i][c_i] += 1
        end
      end
    end
  end

  def place_mines
    #test n_mines <= width*height
    prng = Random.new(Time.now.to_i)
    @n_mines.times do |t|
      r,c = rand_row_col(prng)
      while @board[r][c] == 'X'
        r,c = rand_row_col(prng)
      end
      @board[r][c] = 'X'
    end
  end

  def rand_row_col(prng)
    r = prng.rand(0..@height-1)
    c = prng.rand(0..@width-1)
    [r, c] 
  end

  def print_board
    @board.each do |r|
      r.each do |c|
        print c
      end
      puts
    end
  end
end

MineSweeper.new.generate_board(4,3,4)