class Hangman
  def initialize(word)
    @word = word
    @guesses_remaining = 6
    @guessed_letters = []
  end
  
  def play
    while running?
      display_guesses_remaining
      display_guessed_letters
      display_word_with_guessed_letters
      get_guess
    end
    display_status
  end
  
  private
  
  def display_status
    if won?
      puts "You won"
    else 
      puts "You lost the word was #{@word}"
    end
  end
  
  def get_guess
    print "> "
    guess = gets.chomp
    @guessed_letters << guess
    unless @word.chars.include?(guess)
      @guesses_remaining -= 1
    end
  end
  
  def display_guesses_remaining
    puts "#{@guesses_remaining} guesses remaining"
  end
  
  def display_guessed_letters
    puts @guessed_letters.sort.join(" ")
  end
  
  def display_word_with_guessed_letters
    @word.each_char do |char|
      if @guessed_letters.include?(char)
        print "#{char} "
      else
        print "_ "
      end
    end
    puts
  end
  
  def running?
    !won? && !lost?
  end
  
  def won?
    @word.chars - @guessed_letters == []
  end
  
  def lost?
    @guesses_remaining == 0
  end
  
end
word = "wombat"
hangman = Hangman.new(word)
hangman.play