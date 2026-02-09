# Program to format name and phone number

name <- readline(prompt = "Enter your name: ")
phone <- readline(prompt = "Enter your phone number (digits only): ")

name_upper <- toupper(name)

if (nchar(phone) >= 7) {
  first_three <- substr(phone, 1, 3)
  last_four <- substr(phone, nchar(phone) - 3, nchar(phone))
  formatted_phone <- paste(first_three, "- xxxxx", last_four)
} else {
  formatted_phone <- "Invalid phone number"
}

cat("Hi,", name_upper, ". A verification code has been sent to", formatted_phone, "\n")
