require_relative "w_guess"

word_list = File.readlines("./word_guess/words.txt")
round = Guessing.new(word_list)

get "/word_guess" do
  @word = round.word
  @hidden = round.hidden
  @bad_letters = round.bad_letters
  @message = round.message
  @win = round.win
  @guess = session[:guess]
  @win = round.check_win
  if @win || @bad_letters.length == 7
    if @win
      @message = "Congratulations, You found the word!"
    else
      @message = "That's too bad, the word you didn't find is #{@word.join}"
    end
  end
  erb :"word_guess/index", layout: :"word_guess/layout"
end

post "/word_guess" do
  guess = params["entry"].chomp.downcase
  if round.validate_guess(guess)
    round.check_guess(guess)
  else
    round.message = "Guess a letter, no numbers or special characters!"  
  end
  redirect "/word_guess"
end

post "/word_guess/new" do
  round = Guessing.new(word_list)
  redirect "/word_guess"
end
