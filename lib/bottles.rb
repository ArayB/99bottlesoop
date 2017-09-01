class Bottles
  def verse(n)
    bottle_number = bottle_number_for(n)
    next_bottle_number = bottle_number_for(bottle_number.next_amount)

    "#{bottle_number} of beer on the wall, ".capitalize  +
      "#{bottle_number} of beer.\n" +
      "#{bottle_number.action}" +
      "#{next_bottle_number} of beer on the wall.\n"
  end

  def bottle_number_for(number)
    if number.zero?
      BottleNumberZero
    else
      BottleNumber
    end.new(number)
  end

  def verses(start_verse, end_verse)
    start_verse.downto(end_verse).map { |n| verse(n) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end

class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def container
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def quantity
    number.to_s
  end

  def pronoun
    if number == 1
      'it'
    else
      'one'
    end
  end

  def action
    "Take #{pronoun} down and pass it around, "
  end

  def next_amount
    number - 1
  end
end

class BottleNumberZero < BottleNumber
  def quantity
    'no more'
  end

  def action
    'Go to the store and buy some more, '
  end

  def next_amount
    99
  end
end
