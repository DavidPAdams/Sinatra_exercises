require_relative "w_guess"

@word = ""
until @word.length.between?(5,12)
  @word = File.readlines("words.txt").sample.chomp.downcase
end
@hidden = Array.new(@word.length, "-")

round = Guessing.new(@word, @hidden)

get "/word_guess" do

  erb :'word_guess/index'
end
