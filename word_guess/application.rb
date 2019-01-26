require_relative "w_guess"

werd = ""
until werd.length.between?(5,12)
  werd = File.readlines("words.txt").sample.chomp.downcase
end
round = Guessing.new(werd)

get "/word_guess" do

  round.play
  erb :"word_guess/index", layout: :"word_guess/layout"

end
