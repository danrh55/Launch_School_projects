require './display'

class Board
  attr_accessor :spots

  MARK_SYMS = ['O', 'X', '@', '$']

  def initialize
    @spots = (1..9).to_a
  end

  def sections
    [rows, columns, diagonals].flatten(1)
  end

  def full?
    spots.none? { |spot| (1..9).include?(spot) }
  end

  # rubocop:disable Metrics/AbcSize
  def show
    border = '-' * 25

    puts <<~BOARD
    #{border}
    |   #{spots[0]}   |   #{spots[1]}   |   #{spots[2]}   |
    #{border}
    |   #{spots[3]}   |   #{spots[4]}   |   #{spots[5]}   |
    #{border}
    |   #{spots[6]}   |   #{spots[7]}   |   #{spots[8]}   |
    #{border}
    BOARD
  end
  # rubocop:enable Metrics/AbcSize

  def empty_spots
    spots.select { |spot| (1..9).include?(spot) }
  end

  private

  def columns
    [[spots[0], spots[3], spots[6]],
     [spots[1], spots[4], spots[7]],
     [spots[2], spots[5], spots[8]]]
  end

  def rows
    [[spots[0], spots[1], spots[2]],
     [spots[3], spots[4], spots[5]],
     [spots[6], spots[7], spots[8]]]
  end

  def diagonals
    [[spots[0], spots[4], spots[8]],
     [spots[2], spots[4], spots[6]]]
  end
end
