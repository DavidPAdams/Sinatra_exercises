class Guessing

  attr_accessor :word, :hidden, :entry, :bad_letters, :message, :win

  def initialize(word)
    @word = word.split("")
    @hidden = Array.new(@word.length, "-")
    @guess = ""
    @bad_letters = []   
    @message = ""
    @win = false
  end

  def validate_guess
    ("a".."z").include? @guess ? true : false
  end

  def check_guess
  #compares guessed letter (@guess) to (@word)
  #if included in (@word) then:
    #updates (@hidden)
    if @word.include?(@guess)
      @message =  "Yes, '#{guess}' is in the word, well done!"
      update_hidden
  #if not included in (@word) then:
    #updates (@bad_letters)
    else
      @message =  "Oh no, that'll cost you, '#{guess}' is not in the word."
      update_bad_letters
    end
  end

  def update_hidden
  #cycles through (@word) with index and puts (@guess) in 
  #the indexed position of (@hidden)
    @word.each_with_index do |ltr, i|
      if ltr == @guess
        @hidden[i] = @word[i]
      end
    end
  end

  def update_bad_letters
    @bad_letters << @guess
    @bad_letters.uniq! #takes care of duplicates
  end

  def check_win
  #compares (@hidden) to (@word)
  #if they match (win) == true
    if @word == @hidden
      win = true
  #else (win) remains false
    else
      win = false
    end
  end
  
end
