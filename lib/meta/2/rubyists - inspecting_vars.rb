# Listing local, global, and instance variables
# The local and global variable inspections are straightforward: you use the top-level
# methods local_variables and global_variables.
x = 1
p local_variables
# [:x]
p global_variables
# [:$;, :$-F, :$@, :$!, :$SAFE, :$~, :$&, :$`, :$', :$+, :$=,
# :$KCODE, :$-K, :$,, :$/, :$-0, :$\, :$_, :$stdin, :$stdout,
# :$stderr, :$>, :$<, :$., :$FILENAME, :$-i, :$*, :$?, :$$, :$:,
# :$-I, :$LOAD_PATH, :$", :$LOADED_FEATURES, :$VERBOSE, :$-v, :$-w,
# :$-W, :$DEBUG, :$-d, :$0, :$PROGRAM_NAME, :$-p, :$-l, :$-a, :$1,
# :$2, :$3, :$4, :$5, :$6, :$7, :$8, :$9]

# The global variable list includes globals like 
$: 	# the library load path, also available as $LOAD_PATH 
$~  # a globally available MatchData object based on the most recent pattern-matching operation 
$0  # the name of the file in which execution of the current program was initiated 
$FILENAME # the name of the file currently being executed

c.instance_variables