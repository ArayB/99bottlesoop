class Bottles
  def verse(n)
    "#{quantity(n).capitalize} #{container(n)} of beer on the wall, " \
      "#{quantity(n)} #{container(n)} of beer.\n" \
      "#{action(n)}" \
      "#{quantity(next_amount(n))} #{container(next_amount(n))}" \
      " of beer on the wall.\n"
  end

  def verses(start_verse, end_verse)
    start_verse.downto(end_verse).map { |n| verse(n) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def container(number)
    BottleNumber.new(number).container
  end

  def quantity(number)
    BottleNumber.new(number).quantity
  end

  def pronoun(number)
    BottleNumber.new(number).pronoun
  end

  def action(number)
    BottleNumber.new(number).action
  end

  def next_amount(number)
    BottleNumber.new(number).next_amount
  end
end

class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def container
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def quantity
    if number.zero?
      'no more'
    else
      number.to_s
    end
  end

  def pronoun
    if number == 1
      'it'
    else
      'one'
    end
  end

  def action
    if number.zero?
      'Go to the store and buy some more, '
    else
      "Take #{pronoun} down and pass it around, "
    end
  end

  def next_amount
    if number.zero?
      99
    else
      number - 1
    end
  end
end
