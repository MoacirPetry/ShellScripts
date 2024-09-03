### Searching files with more than 1k lines:

`find . -type f -exec awk 'FNR > 1000 {print FILENAME; exit}' {} \;`
