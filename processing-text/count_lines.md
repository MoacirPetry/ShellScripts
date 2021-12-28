### Count the total of files in the current directory

`find ./ -type f | wc -l`

### Count lines in every files recursively 

`for i in $(find . -type f); do wc -l $i; done >> ./counts.txt`

### Print all files with lines counted

`awk  '{print $1}' counts.txt`

### Show the total of lines

`awk  '{sum+=$1} END {print sum}' counts.txt`

### Count lines recursively on MAC OSX
`find . -name '*.*' | xargs wc -l`
