def get_word
  ["fucker", "asshole", "bitch", "shit"].sample
end

@word = get_word
@guesses = []
def won?
  !@word.split("").map { |letter|
    @guesses.include? letter
  }.include? false
end


def display_word 
  @word.split("").map { |letter|
  if @guesses.include? letter 
    letter
  else
    "_"
  end 
  }.join(" ")
end

def display_screen
  puts "The word is #{display_word}"
  puts "You have #{5-incorrect_guesses} left"
  puts "Guess a letter?"
  # Chomp gets rid of n? which is what enter creates after hitting enter
  response = gets.chomp
  if response.length != 1
    puts "Error, only type one character!"
    display_screen
  elsif @guesses.include? response
    puts "you already guessed that bitch"
    display_screen
  else
    @guesses.push(response)
      
    if @word.split("").include? response
      if won? 
        puts "you have won"
      else
        puts "correct"
        display_screen
      end
    else 
      puts "incorrect"
      if incorrect_guesses >= 5 
        puts "You lost"
      else
        display_screen
      end
    end
  end
end

def incorrect_guesses
  @guesses.select {|letter|
    !@word.split("").include? letter
  }.length
end
display_screen




