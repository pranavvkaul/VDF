#!/bin/bash
fname="TestFile_2.v"

# reading the file and store it in variable called content
content=$(cat "$fname")

# Initialize counters
# | using pipe to pass the output of one command as the input to another command.
# grep command to search line having particular word
#filter the lines that start with //
# and used -v as instead of showing lines that match //, it shows lines that do not have // and passing rest to the next command.
# similarly removing the line that has any whitespace or is empty.
#\btask\b as matches it as a whole word not as part of another word and outputs it & count these lines and giving total occurrences and assign to variable.
#the same happens with all other keywords as well-function, module, endmodule.

count_task=$(echo "$content" | grep -v '^\s*//' | grep -v '^\s*$' | grep -o '\btask\b' | wc -l)
count_function=$(echo "$content" | grep -v '^\s*//' | grep -v '^\s*$' | grep -o '\bfunction\b' | wc -l)
count_module=$(echo "$content" | grep -v '^\s*//' | grep -v '^\s*$' | grep -o '\bmodule\b' | wc -l)
count_endmodule=$(echo "$content" | grep -v '^\s*//' | grep -v '^\s*$' | grep -o '\bendmodule\b' | wc -l)

#printing the outputs
echo "Number of 'task' statements is $count_task"
echo "Number of 'function' statements is $count_function"
echo "Number of 'module' statements is $count_module"
echo "Number of 'endmodule' statements is $count_endmodule"
