# Program to compare two strings (case-insensitive)

string1 <- readline(prompt = "Enter string 1: ")
string2 <- readline(prompt = "Enter string 2: ")

are_same <- tolower(string1) == tolower(string2)

cat("This program compare 2 strings.\n")
cat("Both inputs are similar:", are_same, "\n")
