class NumberGuess
  num = rand(100)+1

  def check_guess(guessing)
    guessed = guessing.to_i
    if guessed <= 0
      message = ""
      color = "lightblue"
    elsif guessed - 5 > num
      message = "Way too high!"
      color = "red"
    elsif guessed > num
      message = "Too high!"
      color = "pink"
    elsif guessed + 5 < num
      message = "Way too low!"
      color = "red"
    elsif guessed < num
      message = "Too low!"
      color = "pink"
    else
      message = "You got it right!"
      color = "green"
    end
    return message, color
  end
end
