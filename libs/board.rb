require 'colorize'

class Board
  attr_accessor :positions

  def initialize
    @positions = { '1' => 1, '2' => 2, '3' => 3,
                   '4' => 4, '5' => 5, '6' => 6,
                   '7' => 7, '8' => 8, '9' => 9 }
  end

  def show_board
    system "clear" # rubocop:disable Style/StringLiterals
    intro
    @positions.each do |key, value|
      if %w[2 5 8].include?(key)
        print "| #{value} |"
      elsif %w[3 6].include?(key)
        print " #{value} \n"
        print "-+---+--\n"
      elsif key == '9'
        print " #{value} \n"
      else
        print value
      end
    end
    puts ''
  end

  def swap_position(type)
    puts "Player #{type} escolha uma posição:"
    position = gets.chomp
    while @positions[position] == 'X' || @positions[position] == 'O'
      puts 'Posição já escolhida, tente novamente'
      position = gets.chomp
    end
    @positions[position] = type
  end

  def check_winner
    if @positions['1'] == @positions['2'] && @positions['1'] == @positions['3']
      @positions['1'] = (@positions['3']).to_s.colorize(:green)
      @positions['2'] = (@positions['3']).to_s.colorize(:green)
      @positions['3'] = (@positions['3']).to_s.colorize(:green)
    elsif @positions['4'] == @positions['5'] && @positions['4'] == @positions['6']
      @positions['4'] = (@positions['4']).to_s.colorize(:green)
      @positions['5'] = (@positions['4']).to_s.colorize(:green)
      @positions['6'] = (@positions['4']).to_s.colorize(:green)
    elsif @positions['7'] == @positions['8'] && @positions['7'] == @positions['9']
      @positions['7'] = (@positions['7']).to_s.colorize(:green)
      @positions['8'] = (@positions['7']).to_s.colorize(:green)
      @positions['9'] = (@positions['7']).to_s.colorize(:green)
    elsif @positions['1'] == @positions['4'] && @positions['1'] == @positions['7']
      @positions['1'] = (@positions['1']).to_s.colorize(:green)
      @positions['4'] = (@positions['1']).to_s.colorize(:green)
      @positions['7'] = (@positions['1']).to_s.colorize(:green)
    elsif @positions['2'] == @positions['5'] && @positions['2'] == @positions['8']
      @positions['2'] = (@positions['2']).to_s.colorize(:green)
      @positions['5'] = (@positions['2']).to_s.colorize(:green)
      @positions['8'] = (@positions['2']).to_s.colorize(:green)
      @positions['2']
    elsif @positions['3'] == @positions['6'] && @positions['3'] == @positions['9']
      @positions['3'] = (@positions['3']).to_s.colorize(:green)
      @positions['6'] = (@positions['3']).to_s.colorize(:green)
      @positions['9'] = (@positions['3']).to_s.colorize(:green)
    elsif @positions['1'] == @positions['5'] && @positions['1'] == @positions['9']
      @positions['1'] = (@positions['1']).to_s.colorize(:green)
      @positions['5'] = (@positions['1']).to_s.colorize(:green)
      @positions['9'] = (@positions['1']).to_s.colorize(:green)
      @positions['9']
    elsif @positions['3'] == @positions['5'] && @positions['3'] == @positions['7']
      @positions['3'] = (@positions['3']).to_s.colorize(:green)
      @positions['5'] = (@positions['3']).to_s.colorize(:green)
      @positions['7'] = (@positions['3']).to_s.colorize(:green)
    end
  end

  def check_tie
    count = 0
    @positions.each_value do |value|
      count += 1 if value.is_a? Numeric
    end
    count
  end

  def intro
    puts "-----------------  T I C - T A C -T O E ---------------\n\n".colorize(color: :light_blue, mode: :bold)
  end
end
