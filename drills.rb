#########################
#### USING ARGUMENTS ####
#########################
#say_hello
  # returns 'hello'
def say_hello 
	"hello"
end
#echo
  # returns the input string
def echo(input)
	input
end
#eddie_izzards_height
  # calculates Eddie Izzards height (67in)
  # and takes into account the height of his heel (default: 0in)
def eddie_izzards_height(heel_height=0)
	67 + heel_height
end
#how_many_args
  # accepts any number of arguments without complaint
  # returns the total number of arguments passed to the function
def how_many_args(*args)
	args.count

end

#find_answer
  # returns the value associated with the 'answer' keyword argument
  # returns nil if it cannot find the 'answer' keyword argument
  # complains when given non-keyword arguments
  def find_answer(**args)
  	args[:answer]  	
  end

##############################
#### MANIPULATING STRINGS ####
##############################
#first_char
  # returns the first letter of the word
  # lowercases the first letter of the word
def first_char(str)
	str[0].downcase
end

#polly_wanna
  # echoes the original word
  # repeats the original word 3 times
def polly_wanna(input)
	input*3
end

#count_chars
  # returns the number of characters in a string
def count_chars(str)
	str.length
end

#yell
  # convert the message to uppercase
  # adds an exclamation point to the end of the message
def yell(str)
	str.upcase + "!"
	
end

#to_telegram
  # replaces periods with ' STOP'
def to_telegram(sentence)
	sentence.gsub(/\./, " STOP")
	
end

#spell_out
  # returns the input string, with characters seperated by dashes
  # converts the string to lowercase
def spell_out(str)
	str.downcase.split("").join("-")
	
end
#seperate
  # seperates characters with a custom seperator, when supplied with one
  # seperates characters with dashes (by default)

def seperate(word, seperator="-")
  word.downcase.split("").join(seperator)
end

#croon
  # seperates word characters with dashes
  # preserves whitespace between words
def croon (sentence)
	sentence.split(" ").map {|word| word.split("").join("-")}.join(" ")
end

#palindrome_word?
  # determines whether a single word is a palindrome
  # ignores case
def palindrome_word?(word)
 	normalized = word.downcase
 	normalized.reverse == normalized
end 


#palindrome_sentence?
  # determines whether a sentence is a palindrome
  # ignores case
  # ignores whitespace
  # ignores punctuation
def palindrome_sentence?(sentence)
	normalized = sentence.gsub(/[^a-z]/i, "").downcase
	normalized.reverse == normalized
end
#is_vowel
  # determines whether a given character is a vowel
  # ignores case
  # handles weird inputs gracefully
def is_vowel(letter)
	letter.is_a?(String) && !!letter.match(/[aeiou]/i)
end

#add_period
  # adds a period to the end of the sentence
  # does not add a period if one is already there
  # does not add a period if any form of terminal punctuation is present
def add_period(input)
  "!?.".include?(input[-1]) ? input : input + "."
end


###########################
#### LOOPS & ITERATORS ####
###########################
#count_spaces
  # counts the spaces in a string
def count_spaces(str)
	count = 0
	space = " "
	str.each_char do |character|
		if character == space
			count +=1
		end
	end
	count
end

#string_lengths
  # converts a list of strings to a list of string lengths
def string_lengths(list)
	list.map { |str| str.length }	
end

#remove_falsy_values
  # filters out falsy values from a list
def remove_falsy_values(list)
	list.select {|item| !!item}
	
end
#exclude_last
  # removes the last item from an array
  # removes the last item from a string
def exclude_last(sequence)
	sequence[0..-2]

end
#exclude_first
  # removes the first item from an array
  # removes the first character from a string
  # does not alter the original input (non-destructive)
def exclude_first(sequence)
	sequence[1..-1]	
end

#exclude_ends
  # removes the first and last items from an array
  # removes the first and last characters from a string
def exclude_ends(sequence)
	sequence[1..-2]
	
end

#select_every_even
  # returns a list of even-indexed items
def select_every_even(list)
	list.select.with_index {|item, index| item if index.even?}
end

#select_every_odd
  # returns a list of odd-indexed items
def select_every_odd(list)
	list.select.with_index {|item, index| item if index.odd?}
end
#select_every_n
  # returns a list of items at an index evenly divisible by n
  # defaults to an n value of 1

def select_every_n(list, interval=1)
	list.select.with_index {|item, index| item if index%interval == 0} 
	
end

#compile_agenda
  # converts a list of agenda items into a single string
  # titles start with a bullet ("*") and are separated by line breaks ("/n")
  # sorts items by priority ascending (low to high) by default
  # sort order can (optionally) be changed to priority descending
  # the bullet can (optionally) be changed to any symbol

def compile_agenda(items, order="DESC", bullet="*")
	sorted_items = items.sort_by {|o| o[:priority]}
	sorted_items.reverse! if order == "ASC"
	sorted_items.map {|o| "#{bullet} #{o[:title]}" }.join("\n")
end

##############################
#### MANIPULATING NUMBERS ####
##############################
#count_to
  # returns an array containing every integer from 0 to n
  # rounds off decimals
def count_to(n)
	n = n.to_i
	if n >=0 
	  	(0..n).to_a
	  else
	  	0.downto(n).to_a
	  end
end

#is_integer?
  # returns true for Fixnums and Bignums (whole number or 'integer' types)
  # returns true for Floats (decimals) equal to integers
  # returns false for non-integer decimals
  # returns false for Float::NAN
  # returns false for non-numbers
def is_integer?(num)
  num.class == Fixnum || num.class == Bignum || 
    ( num.is_a?(Float) && !num.nan? && num.to_i == num )
end


#is_prime?
  # returns false for non-integer decimals
  # returns false for numbers less than or equal to 1
  # returns false for numbers divisible by anything but 1 and themselves
  # returns true for prime numbers
def is_prime?(num)
	if !is_integer?(num) || num <= 1
		false
	elsif num <= 1
		false
	else
	(2..(num-1)).each do |n|
	  if num % n == 0
	  return false 
	 end
	end
	true
  end 
end

#primes_less_than
  # returns an empty array if there are no primes below num
  # does not return the number itself
  # finds all primes less than the given number
def primes_less_than(num)
 primes = []
 (2..num-1).each do |n|
 	if is_prime?(n)
 		primes.push n
 	end
 end
 primes
end

#iterative_factorial
  # returns 1 for 0 and 1
  # returns NaN for numbers less than 0
  # returns NaN for non-integers
  # calculates factorial
def iterative_factorial(num)
  if num < 0 || !is_integer?(num)
  	return Float::NAN
  end
  memo = 1
  (1..num).each do |i|
  	memo = memo*i
  end
  memo
end




##############################
#### MANIPULATING OBJECTS ####
##############################
#character_count
  # counts how many times each character appears in a string
  # ignores case
def character_count(str)
  char_counts = {}
  str.each_char do |char|
  	char = char.downcase
  	if char_counts[char].nil?
  		char_counts[char] = 1
  	else
  		char_counts[char] += 1
  	end
  end
  char_counts
end

#word_count
  # counts how many times a word appears in a string
  # ignores case
  # ignores characters that are not in the sequence a-z
def word_count(sentence)
  word_counts = {}
  sentence.split(" ").each do |word|
    word = word.downcase.gsub(/[^a-z]/i, "")
    if word_counts[word].nil?
      word_counts[word] = 0
    else
      word_counts += 1
    end
  end
  word_counts
end

#most_frequent_word
  # finds the word in a string that appears with the most frequency
def most_frequent_word(sentence)
  word_counts = word_count(sentence)
  word_counts.empty? ? nil : word_counts.invert.max[1]
end

