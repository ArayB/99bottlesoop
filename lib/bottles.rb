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
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def quantity(number)
    if number.zero?
      'no more'
    else
      number.to_s
    end
  end

  def pronoun(number)
    if number == 1
      'it'
    else
      'one'
    end
  end

  def action(number)
    if number.zero?
      'Go to the store and buy some more, '
    else
      "Take #{pronoun(number)} down and pass it around, "
    end
  end

  def next_amount(number)
    if number.zero?
      99
    else
      number - 1
    end
  end
end
