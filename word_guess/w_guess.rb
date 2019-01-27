class Guessing

  attr_accessor :word, :hidden, :entry, :bad_letters, :message, :win

  def initialize(word)
    @word = word
    @hidden = Array.new(@word.length, "-")
    @entry = ""
    @bad_letters = []   
    @message = ""
    @win = false
  end

  def play
    until @bad_letters.length == 7 || @win == true
      display(hidden)
      guess = get_letter(hidden)
      check_guess(guess, hidden)
      win = check_win(win, hidden)
    end
    if win
      congratulations
    elsif @bad_letters.length == 7
      too_bad
    end
  end

  def get_letter
    #asks player for letter guessed
    entry = ""
    until ("a".."z").include? entry
      print "\nEnter your letter: " 
      entry = gets.chomp.downcase
    end
    return entry
  end

  def check_guess(guess, hidden)
  #compares guessed letter (guess) to (@word)
  #if included in (@word) then:
    #updates (hidden)
    if @word.include?(guess)
      puts "\nYes, '#{guess}' is in the word, well done!"
      update_hidden(guess, hidden)
  #if not included in (@word) then:
    #updates (@bad_letters)
    else
      puts "\nOh no, that'll cost you, '#{guess}' is not in the word."
      update_bad_letters(guess)
    end
  end

  def update_hidden(guess, hidden)
  #cycles through (@word) with index and puts (guess) in 
  #the indexed position of (hidden)
    @word.each_with_index do |ltr, i|
      if ltr == guess
        hidden[i] = @word[i]
      end
    end
  end

  def update_bad_letters(guess)
    @bad_letters << guess
    @bad_letters.uniq! #takes care of duplicates
  end

  def check_win(win, hidden)
  #compares (hidden) to (@word)
  #if they match (win) == true
    if @word == hidden
      win = true
  #else (win) remains false
    else
      win = false
    end
  end

  def congratulations
  #shows atta_boy for guessing the (@word) and displays 
  #remaining (wrong) guesses to spare
    puts "\n\n"
    puts "! " * 40
    puts "\nCongratulations, you correctly guessed the word '#{@word.join}'!\n
    And with #{7 - @bad_letters.length} guess(es) to spare!\n"
  end

  def too_bad
  #better luck next time, too bad you didn't figure out the (@word)
    puts "\n\n" + "#" * 75
    puts "\n     * *\n      ~"
    puts "\nToo bad, you got all hung up. The word you didn't guess is #{@word.join}.\n"
  end


end
