class Guessing

  attr_accessor :word, :hidden, :guess, :bad_letters, :message, :win

  def initialize(werd_list)
    @word = set_word(werd_list)
    @hidden = Array.new(@word.length, "-")
    @guess = ""
    @bad_letters = []   
    @message = ""
    @win = false
  end

  def set_word(werd_list)
    werd = ""
    until werd.length.between?(5,12)
      werd = werd_list.sample.chomp.downcase.split("")
    end
    werd
  end

  def validate_guess(guess)
    ("a".."z").include?(guess) ? true : false
  end

  def check_guess(guess)
  #compares guessed letter (@guess) to (@word)
  #if included in (@word) then:
    #updates (@hidden)
    if @word.include?(guess)
      @message =  "Yes, '#{guess}' is in the word, well done!"
      update_hidden(guess)
  #if not included in (@word) then:
    #updates (@bad_letters)
    else
      @message =  "Oh no, that'll cost you, '#{guess}' is not in the word."
      update_bad_letters(guess)
    end
  end

  def update_hidden(guess)
  #cycles through (@word) with index and puts (guess) in 
  #the indexed position of (@hidden)
    @word.each_with_index do |ltr, i|
      if ltr == guess
        @hidden[i] = @word[i]
      end
    end
  end

  def update_bad_letters(guess)
    @bad_letters << guess
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
