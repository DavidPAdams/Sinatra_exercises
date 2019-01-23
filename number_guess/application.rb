require_relative "n_guess"

round = NumberGuess.new

get "/number_guess" do
  numbr = round.num
  guess = params["guess"]
  message, coloring = check_guess(guess)
  erb :'number_guess/index', locals: { number: numbr, message: message, guessed: guess.to_i, color: coloring }
end
