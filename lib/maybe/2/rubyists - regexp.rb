# search for word match, and put to array , also the sorrounding words.

# Any pattern-matching operation has two main players: a regexp and a string.
puts "Match!" if /abc/.match("The alphabet starts with abc.")
puts "Match!" if "The alphabet starts with abc.".match(/abc/)

# The string version of match converts a string argument to a regexp.

# In addition to the match method, Ruby also features a pattern-matching operator, =~

# Both match and =~ return nil if there is no match, that's the same part of them.
# Where match and =~ differ from each other chiefly is in what they return when there is
# a match: =~ returns the numerical index of the character in the string where the
# match started, whereas match returns an instance of the class MatchData:

"The alphabet starts with abc" =~ /abc/
# => 25

/abc/.match("The alphabet starts with abc.")
# => #<MatchData "abc">


/a/ 	# This regexp matches the string "a" as well as any string containing the letter a

/a?/	# zero or more a's

/\?/	# The backslash means "don't treat the next character as special; treat it as itself."
# The special characters include: ( ^ $ ? . / \ [ ] { } ( ) + * ) .

/./		# matches any characters

# Character classes
/[dr]ejected/	 # matches dejected and rejected, match either d or r
/[a-z]/				 # matches all lower case letters
/[A-Fa-f0-9]/	 # matches any character a through f (upper- or lowercase) or any digit. 

#^ # negating 
/^[A-Fa-f0-9]/

SPECIAL ESCAPE SEQUENCES FOR COMMON CHARACTER CLASSES
/\d/		# matches any digit
/\w/ 		# matches any digit, alphabetical character, or underscore (_).
/\s/ 		# matches any whitespace character (space, tab, newline).

# negated form: \D, \W, \S


# Matching, substring captures, and MatchData

# Capturing submatches with parentheses
/([A-Za-z]+),[A-Za-z]+,(Mrs?\.)/.match("Peel,Emma,Mrs.,talented amateur")

# 2 things happen:
# - We get a MatchData object that gives us access to the submatches
# - Ruby automatically populates a series of variables for us, which also give us
# 	access to those submatches.

# The variables that Ruby populates are global variables, and their names are based on
# numbers: $1, $2, and so forth. $1 contains the substring matched by the subpattern
# inside the first set of parentheses from the left in the regexp.

string = "My phone number is (123) 555-1234."
phone_re = /\((\d{3})\)\s+(\d{3})-(\d{4})/
m = phone_re.match(string)
unless m
  puts "There was no match—sorry."
  exit
end
print "The whole string we started with: "
puts m.string
print "The entire part of the string that matched: "
puts m[0]
puts "The three captures: "
3.times do |index|
  puts "Capture ##{index + 1}: #{m.captures[index]}"
end
puts "Here's another way to get at the first capture:"
print "Capture #1: "
puts m[1]

# The whole string we started with: My phone number is (123) 555-1234.
# The entire part of the string that matched: (123) 555-1234
# The three captures:
# Capture #1: 123
# Capture #2: 555
# Capture #3: 1234
# Here's another way to get at the first capture:
# Capture #1: 123

# The following equations hold true
# m[1] == m.captures[0]
# m[2] == m.captures[1]

/((a)((b)c))/.match("abc")
# What will be in the various captures? Well, just count opening parentheses from the
# left. For each opening parenthesis, find its counterpart on the right. Everything inside
# that pair will be capture number n, for whatever n you’ve gotten up to.
# => <MatchData "abc" 1:"abc" 2:"a" 3:"bc" 4:"b">

Greedy
* 	# zero or more
  + 	# one or more

  # The * (zero-or-more) and + (one-or-more) quantifiers are greedy. This means they
  # match as many characters as possible.
  string = "abc!def!ghi!"
match = /.+!/.match(string)
puts match[0]
# => "abc!def!ghi!"

# You can make + as well as * into non-greedy quantifiers by putting a question mark
# after them.
match = /.+?!/.match(string)	
puts match[0]
# => abc!

/(\d+?)/.match("Digits-R-Us 2345")
puts $1
# => 2

/\d+5/.match("Digits-R-Us 2345")
# If the one-or-more quantifier's greediness were absolute, the \d+ would match all four
# digits—and then the 5 in the pattern wouldn't match anything, so the whole match
# would fail. But greediness always subordinates itself to ensuring a successful match.
# What happens, in this case, is that after the match fails, the regexp engine backtracks: it
# un-matches the 5 and tries the pattern again. This time, it succeeds: it has satisfied
# both the \d+ requirement and the requirement that 5 follow the digits that \d+
# matched.

# Let's let irb and the MatchData object show us the relevant captures:
>> /(\d+)(5)/.match("Digits-R-Us 2345")
# => #<MatchData "2345" 1:"234" 2:"5">

Repetitions
/\d{3}/			# matches any 3 digits
/\d{1,10}/	# specifies a range
/\d{3,}/		# 3 or more digits

# limitations of parenthesis
/([A-Z]){5}/.match("David BLACK")
# => #<MatchData "BLACK" 1:"K">

# It's just "K". Why isn't "BLACK" captured in its entirety?
# The reason is that the parentheses don't "know" that they're being repeated five
# times. They just know that they're the first parentheses from the left (in this particular
# case) and that what they've captured should be stashed in the first capture slot
# ($1, or captures[1] off the MatchData object). The expression inside the parentheses,
# [A-Z], can only match one character. If it matches one character five times in a
# row, it's still only matched one at a time—and it will only "remember" the last one.

# If you want to capture all five characters, you need to move the parentheses so they
# enclose the entire five-part match:
/([A-Z]{5})/.match("David BLACK")
# => #<MatchData "BLACK" 1:"BLACK">

# Regular expression anchors and assertions
^		# beginning of line
$		# end of line

# Regular expression anchors

# Notation		Description 							Example 						 Sample matching string
# ^ 					Beginning of line 				/^\s*#/ 						 # A Ruby comment line with leading spaces
# $ 					End of line 							/\.$/ 							 one\ntwo\nthree.\nfour
# \A 					Beginning of string 			/\AFour score/ 			 Four score
# \z 					End of string 						/from the earth.\z/  from the earth.
# \Z 					End of string (except for
# 						final newline)						/from the earth.\Z/  from the earth\n
# \b 					Word boundary 						/\b\w+\b/ 					 !!!word*** (matches word)







