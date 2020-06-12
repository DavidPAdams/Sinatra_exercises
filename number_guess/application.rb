require_relative "n_guess"

round = NGuess.new

get "/number_guess" do
  numbr = round.num
  guess = params["guess"]
  message, coloring = round.check_guess(guess)
  erb :'number_guess/index', locals: { number: numbr, message: message, guessed: guess.to_i, color: coloring }
end

post "/number_guess/new" do
  redirect "/number_guess"
end
