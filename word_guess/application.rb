require_relative "w_guess"

werd = ""
until werd.length.between?(5,12)
  werd = File.readlines("words.txt").sample.chomp.downcase
end
round = Guessing.new(werd)

get "/word_guess" do
  @message = ""
  if @win || @bad_letters == 7
    if @win
      @message = "Congratulations, You found the word!"
    else
      @message = "That's too bad, the word you didn't find is #{@word.join}"
    end
  end
  erb :"word_guess/index", layout: :"word_guess/layout"
end

post "/word_guess" do
  @guess = params["entry"].chomp.downcase
  if round.validate_guess
    round.check_guess
    round.check_win
  else
    @message = "Guess a letter, no numbers or special characters!"  
  end
  redirect "/word_guess"
end

post "/word_guess/new" do
  mot = ""
  until mot.length.between?(5,12)
    mot = File.readlines("words.txt").sample.chomp.downcase
  end
  round = Guessing.new(mot)
  redirect "/word_guess"
end
