def draw_man(part_nu)
  if part_nu == 0
    puts " ____\n|    |\n|\n|\n|\n|\n|_______"
  elsif part_nu == 1
    puts " ____\n|    |\n|    @\n|\n|\n|\n|_______"
  elsif part_nu == 2
    puts " ____\n|    |\n|    @\n|    |\n|\n|\n|_______"
  elsif part_nu == 3
    puts " ____\n|    |\n|    @\n|   /|\n|\n|\n|_______"
  elsif part_nu == 4
    puts " ____\n|    |\n|    @)\n|   /|\n|\n|\n|_______"
  elsif part_nu == 5
    puts " ____\n|    |\n|    @)\n|   /|\n|    |\n|\n|_______"
  elsif part_nu == 6
    puts " ____\n|    |\n|    @)\n|   /|\n|    |\n|   /\n|_______"
  elsif part_nu == 7
    puts " ____\n|    |\n|    @)\n|   /|\n|    |\n|   / )\n|_______"
  end
end

def display_guess_process(word, letter, partnu)
  letters = word.split('')
  number_of_spaces = letters.count

  print "Word:"

  letters.each do |l|
    if letter.include?(l)
      where_in_array = letter.index(l)
      print " " + letter[where_in_array]
    elsif !letter.include?(l)
      print " _"
    end
  end

  puts "\nLetters already guesssed: " + letter[0..(7 + number_of_spaces)].join(', ')

  draw_man(partnu - 1)

  x = 0

  letters.each do |letter_word|
    letter.each do |letter_guess|
      if letter_word == letter_guess
        x = x + 1
        if x == letters.count
          puts 'You win! The man is free.'
          puts "    @\n   /|\\\n    |\n   / \\"
          exit
        elsif (partnu) == 8 && !(x == letters.count)
          puts 'You lose. The man has been hanged.'
          puts "Word: " + word
          exit
        end
      end
    end
  end
end

f = File.new("./english-dictionary.txt", "r")
words = f.readlines
f.close

word = words.sample.chomp

bad_guesses = 0

letter = []

word_array = word.split('')

puts "Word:" + (" _" * word_array.count)

letters_array = ("a".."z").to_a

while 1 == 1
  puts "Guess?"
  letter1 = gets.chomp
  if letter.include?(letter1)
    puts 'You already guessed this letter.'
  elsif !letters_array.include?(letter1)
    puts "This is not a valid guess."
  else
    if !word_array.include?(letter1)
      bad_guesses = bad_guesses + 1
    end
    letter.push(letter1)
    display_guess_process(word, letter, bad_guesses)
  end
end