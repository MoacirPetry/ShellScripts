Looking for an expression or a string in many files  
`
grep -R "expression that you are looking for" ./*
`

Find a string and count
cat text_file.txt | grep -c Japan

Find a string with case sensitive
cat text_file.txt | grep -w Japan
