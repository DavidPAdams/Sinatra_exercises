NUM = rand(100)+1

def check_guess(guessing)
  guessed = guessing.to_i
  if guessed <= 0
    message = ""
    color = "lightblue"
  elsif guessed - 5 > NUM
    message = "Way too high!"
    color = "red"
  elsif guessed > NUM
    message = "Too high!"
    color = "pink"
  elsif guessed + 5 < NUM
    message = "Way too low!"
    color = "red"
  elsif guessed < NUM
    message = "Too low!"
    color = "pink"
  else
    message = "You got it right!"
    color = "green"
  end
  return message, color
end

get "/" do
  guess = params["guess"]
  message, coloring = check_guess(guess)
  erb :index, :locals => { :number => NUM, :message => message, :guessed => guess.to_i, :color => coloring }
end
