class Player
  attr_reader :name
  attr_reader :mark
  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end


class Game
  attr_accessor :playerX
  attr_accessor :playerO
  attr_accessor :turn
  attr_accessor :turn_number

  def initialize()
    @board = Board.new()
    @turn  = @playerX
    @turn_number = 0
    start_game()
  end

  def start_game
    puts "Welcome to tic-tac-toe!  Player X put in your name"
    @playerX = Player.new(gets.chomp(), 'X')
    puts "Player O put in your name"
    @playerO = Player.new(gets.chomp(), 'O')
    puts "To take a turn, enter the number that coresponds to the space you would like and hit enter.  PlayerX starts"
    take_turn(@playerX.mark, @playerX.name)
  end

  def take_turn(mark, player)
    @turn_number += 1
    if @turn_number == 10
      puts "it's a draw!"
    else
      puts @board.print_board()
      puts "#{player} enter a space number to put your #{mark}"
      choice = gets.chomp.to_i - 1
      while @board.spaces[choice].is_a? String
        puts 'pick a space that has not already been chosen'
        puts "#{player} enter a space number to put your #{mark}"
        choice = gets.chomp.to_i - 1
      end
      @board.spaces[choice] = mark
      if @board.check_for_winner(mark, player, choice)
        puts 'Would you like to play again?'
      else
        mark == 'X' ? take_turn(playerO.mark, playerO.name) : take_turn(playerX.mark, playerX.name)
      end
    end
  end


end


class Board
  attr_accessor :spaces
  attr_reader :winning_combos

  def initialize
    @spaces = (1..9).to_a
    @turn_number = 1
    @winning_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def print_board
   return "|#{@spaces[0]}|#{@spaces[1]}|#{@spaces[2]}|\n|#{@spaces[3]}|#{@spaces[4]}|#{@spaces[5]}|\n|#{@spaces[6]}|#{@spaces[7]}|#{@spaces[8]}|"
  end


  def check_for_winner(mark, player, choice)
    is_winner = false
    @winning_combos.each do |combo|
      all_same = true
      combo.each do |space|
        if spaces[space] != mark
          all_same = false
        else
      end
    end
      if all_same == true
        puts "Player#{mark} wins!"
        return true
      else
      end
    end

      return false
  end
end


Game.new()

