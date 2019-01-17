require "sinatra"
require "sinatra/reloader"

NUM = rand(100)+1

def check_guess(guessing)
  guessed = guessing.to_i
  message = ""
  if guessed <= 0
    message = ""
  elsif guessed - 5 > NUM
    message = "Way too high!"
  elsif guessed > NUM
    message = "Too high!"
  elsif guessed + 5 < NUM
    message = "Way too low!"
  elsif guessed < NUM
    message = "Too low!"
  else
    message = "You got it right!"
  end
  return message
end

def check_color(msg)
  if msg == ""
    colour = "lightblue"
  elsif msg == "Way too high!" || msg == "Way too low!"
    colour = "red"
  elsif msg == "Too high!" || msg == "Too low!"
    colour = "pink"
  else
    colour = "lightgreen"
  end
  return colour
end

get "/" do
  guess = params["guess"]
  message = check_guess(guess)
  coloring = check_color(message)  
  erb :index, :locals => { :number => NUM, :message => message, :guessed => guess.to_i, :color => coloring }
end
