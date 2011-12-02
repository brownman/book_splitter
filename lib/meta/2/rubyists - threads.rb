# basic
Thread.new do
	puts "Starting the thread"
	sleep 1
	puts "At the end of the thread"
end
puts "Outside the thread"

# =>  Starting the thread
# =>  Outside the thread

# join
t = Thread.new do
	puts "Starting the thread"
	sleep 1
	puts "At the end of the thread"
end
puts "Outside the thread"
t.join

# =>  Starting the thread
# =>  Outside the thread
# =>  At the end of the thread

# To kill a thread, you send it the message kill, exit, or terminate; all three are equivalent.
# Or, if you're inside the thread, you call kill (or one of its synonyms) in classmethod
# form on Thread itself.
puts "Trying to read in some files..."
t = Thread.new do
	(0..2).each do |n|
		begin
			File.open("part0#{n}") do |f|
				text << f.readlines
			end
		rescue Errno::ENOENT
			puts "Message from thread: Failed on n=#{n}"
			Thread.exit
		end
	end
end
t.join
puts "Finished!"

# You can also stop and start threads, and examine their state. A thread can be asleep or
# awake, and alive or dead.
t = Thread.new do
	puts "[Starting thread]"						# [Starting thread]
	Thread.stop										
	puts "[Resuming thread]"
end
puts "Status of thread: #{t.status}"	# Status of thread: sleep
puts "Is thread stopped? #{t.stop?}"	# Is thread stopped? true
puts "Is thread alive? #{t.alive?}"		# Is thread alive? true
puts
puts "Waking up thread and joining it..."
t.wakeup
t.join																# [Resuming thread]
puts
puts "Is thread alive? #{t.alive?}"		# Is thread alive? false


# Thread allows servers to handle multiple clients
require 'socket'
s = TCPServer.new(3939)
while (conn = s.accept)
	Thread.new(conn) do |c|  # Each thread has a reference to its own connection
		c.print "Hi. What's your name? "
		name = c.gets.chomp
		c.puts "Hi, #{name}. Here's the date."
		c.puts `date`
		c.close
	end
end


# A chat server
require 'socket'
def welcome(chatter)
	chatter.print "Welcome! Please enter your name: "
	chatter.readline.chomp
end

def broadcast(message, chatters)
	chatters.each do |chatter|
		chatter.puts message
	end
end

s = TCPServer.new(3939)
chatters = []

while (chatter = s.accept)
	Thread.new(chatter) do |c|
		name = welcome(chatter)
		broadcast("#{name} has joined", chatters)
		chatters << chatter
		begin
			loop do
				line = c.readline
				broadcast("#{name}: #{line}", chatters)
			end
		rescue EOFError
			c.close
			chatters.delete(c)
			broadcast("#{name} has left", chatters)
		end
	end
end

# Threads and variables
# Threads run using code blocks, and code blocks can see the variables created in their
# local scope. If you create a local variable and change it inside a thread’s code block,
# the change will be permanent:
a = 1  							 	# => 1
Thread.new { a = 2 } 	# => #<Thread:0x390d8c run>
a											# => 2

# Global variables remain global, for the most part, in the face of threads. That goes for
# built-in globals, such as $/ (the input record separator), as well as those you create
# yourself:
$/										# => "\n"
$var = 1							# => 1
Thread.new { $var = 2; $/ = "\n\n" }	# => #<Thread:0x38dbb4 run>
$/ 										# => "\n\n"
$var									# => 2

# But some globals are thread-local globals—specifically, the $1, $2, ..., $n that are
# assigned the parenthetical capture values from the most recent regular expression–
# matching operation.
/(abc)/.match("abc")
t = Thread.new do
	/(def)/.match("def")
	puts "$1 in thread: #{$1}"		# => $1 in thread: def
end.join
puts "$1 outside thread: #{$1}" # => $1 outside thread: abc

# The rationale for this behavior is clear: you can't have one thread's idea of $1 overshadowing
# the $1 from a different thread, or you'll get extremely odd results.


# Manipulating thread keys
# Thread keys are basically a storage hash for thread-specific values. The keys must be
# symbols or strings.
t = Thread.new do
	Thread.current[:message] = "Hello"
end
t.join
p t.keys
puts t[:message]
# => [:message]
# => Hello

# Rock/Scissor/Paper game
module Games
	class RPS
		include Comparable
		WINS = [ %w{ rock scissors }, %w{ scissors paper }, %w{ paper rock }]
		
		attr_accessor :move
		
		def initialize(move)
			@move = move.to_s
		end
		
		def <=>(other)
			if move == other.move
				0
			elsif WINS.include?([move, other.move])
				1
			elsif WINS.include?([other.move, move])
				-1
			else
				raise ArgumentError, "Something's wrong"
			end
		end
		
		def play(other)
			if self > other
				self
			elsif other > self
				other
			else
				false
			end
		end
	end
end

# play the game
require 'socket'
require 'rps'

s = TCPServer.new(3939)
threads = []

2.times do |n|
	conn = s.accept
	threads << Thread.new(conn) do |c|
		Thread.current[:number] = n + 1
		Thread.current[:player] = c
		c.puts "Welcome, player #{n+1}!"
		c.print "Your move? (rock, paper, scissors) "
		Thread.current[:move] = c.gets.chomp
		c.puts "Thanks... hang on."
	end
end

a,b = threads
a.join
b.join

rps1, rps2 = Games::RPS.new(a[:move]), Games::RPS.new(b[:move])
winner = rps1.play(rps2)

if winner
	result = winner.move
else
	result = "TIE!"
end

threads.each do |t|
	t[:player].puts "The winner is #{result}!"
end