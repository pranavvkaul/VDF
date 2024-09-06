#fname variable contains the file to be opened
set fname "TestFile_2.v"
#using the fhandle variable to read the files
set fhandle [open $fname r]

#initialize all counters to 0
set count_always 0
set count_initial 0
set count_begin 0
set count_end 0

#reading entire content of the fhandle data and storing it in the variable called content 
set content [read $fhandle]

#the below line will take the above file and split will make it kind of a list of strings including spaces into variable lines
#so every line becomes a string & i can handle each line separately 
set lines [split $content "\n"]

#mainwork
#running a loop that will run through each line in the variable lines
foreach line $lines {
    #removing the whitespaces from begin and end of each line, 
    #by default, if no characters are specified,it will remove whitespaces
    set line [string trim $line]

    #the below line checks 2 conditions, #if any of the condition violates we wont consider it
    #1) if line is not empty "length>0"
    #2) if line doesnt start with // as it represent comments in verilog, which must be avoided #stringfirst used to search first occurrence
    if {[string length $line] > 0 && [string first "//" $line] != 0} {
        #plitting the line into words into words based on spaces, which are to be analysed
        set words [split $line " "]

#counting the corresponding words
#looping over each word to find if it matches always/initial/begin/end 
        foreach word $words {
            if {$word eq "always"} {
#eq used to compare strings, if condition is met the counters that i made initially will be incremented
                set count_always [expr {$count_always + 1}]
            }}

        foreach word $words {
            if {$word eq "initial"} {
                set count_initial [expr {$count_initial + 1}]
            }}

        foreach word $words {
            if {$word eq "begin"} {
                set count_begin [expr {$count_begin + 1}]
            }}

        foreach word $words {
            if {$word eq "end"} {
                set count_end [expr {$count_end + 1}]
            }}
    }}

#printing the outputs 
puts "Number of 'always' statements is $count_always"
puts "Number of 'initial' statements is $count_initial"
puts "Number of 'begin' statements is $count_begin"
puts "Number of 'end' statements is $count_end"

#My code reads the entire file content, splits it into individual lines, and processes each line to ignore empty lines and comments. 
#Then processing words in each line, it increments counters for each keyword found and prints the total counts.
