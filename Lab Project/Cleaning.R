#  1. Load required libraries
library(dplyr)
library(stringr)
library(lubridate)

# 2. Read the raw file as plain text
raw_lines <- readLines("D:/Repos/DS_TEB2043/Lab Project/Unclean Dataset.csv", warn = FALSE, encoding = "latin1")

# Remove the header to reassign manually
raw_lines <- raw_lines[-1]

# 3. Normalise delimiters
raw_lines <- gsub("\\|", ",", raw_lines)


# 4. Parse into a data frame
df_raw <- read.csv(text = paste(raw_lines, collapse = "\n"), header = FALSE, 
                   fill = TRUE, blank.lines.skip = TRUE, stringsAsFactors = FALSE, 
                   strip.white = TRUE)

# Remove extra column
df_raw <- df_raw[, 1:8]

# Assign clean column names
colnames(df_raw) <- c("Student_ID", "First_Name", "Last_Name", 
                      "Age", "Gender", "Course", "Enrollment_Date", "Total_Payments")


# 5. Remove completely empty rows
df <- df_raw %>% 
  filter(rowSums(. == "" | is.na(.)) < ncol(.))


# 6. Clean Student_ID
df$Student_ID <- str_trim(df$Student_ID)
df$Student_ID <- gsub("[^0-9]", "", df$Student_ID)
df$Student_ID[df$Student_ID == ""] <- NA


# 7. Clean First_Name & Last_Name 
clean_name <- function(x) {
  x <- str_trim(x)
  x <- str_to_title(x)
  x[x == ""] <- NA
  return(x)
}

df$First_Name <- clean_name(df$First_Name)
df$Last_Name  <- clean_name(df$Last_Name)

both_same_fullname <- !is.na(df$First_Name) &
  !is.na(df$Last_Name) &
  df$First_Name == df$Last_Name &
  str_detect(df$First_Name, " ")

split_names <- str_split_fixed(df$First_Name[both_same_fullname], " ", 2)
df$First_Name[both_same_fullname] <- split_names[, 1]
df$Last_Name[both_same_fullname]  <- split_names[, 2]


# 8. Clean Age 
gender_age_mask <- str_detect(df$Gender, "^[MmFf]\\s+\\d+$")
if (any(gender_age_mask, na.rm = TRUE)) {
  parts <- str_split_fixed(df$Gender[gender_age_mask], "\\s+", 2)
  df$Gender[gender_age_mask] <- parts[, 1]
  df$Age[gender_age_mask]    <- parts[, 2]
}

df$Age <- as.integer(gsub("[^0-9]", "", str_trim(df$Age)))

df$Age[!is.na(df$Age) & (df$Age < 10 | df$Age > 75)] <- NA

# 9. Clean Gender 
# Standardise to "M" or "F"
df$Gender <- str_trim(toupper(df$Gender))
df$Gender <- str_extract(df$Gender, "^[MF]")
df$Gender[!df$Gender %in% c("M", "F")] <- NA


# 10. Clean Course 
# Fix common truncations and typos, then title-case.
df$Course <- str_trim(df$Course)
df$Course[df$Course == ""] <- NA

# Map known truncations / typos to full correct names
course_fixes <- c(
  "Machine Learnin"  = "Machine Learning",
  "Web Developmen"   = "Web Development",
  "Web Developmet"   = "Web Development",
  "Web Develpment"   = "Web Development",
  "Data Analytics"   = "Data Analytics",
  "Data Analysis"    = "Data Analysis",
  "Cyber Security"   = "Cyber Security"
)
for (bad in names(course_fixes)) {
  df$Course[!is.na(df$Course) & df$Course == bad] <- course_fixes[bad]
}

# Remove rows where Course is invalid
df$Course[!is.na(df$Course) & grepl("^[0-9]+$", df$Course)] <- NA


# 11. Clean Enrollment_Date 
# Multiple date formats exist:
#   "2022-05-15"  →  ISO format
#   "05-09-23"    →  MM-DD-YY  (ambiguous; treated as MM-DD-YY)
#   "08-01-24"    →  MM-DD-YY
#   "01-Jul-21"   →  DD-Mon-YY
# "NA" strings are set to NA; blank cells also become NA.

df$Enrollment_Date <- str_trim(df$Enrollment_Date)
df$Enrollment_Date[df$Enrollment_Date %in% c("NA", "", "N/A")] <- NA

parse_dates <- function(x) {
  # Try ISO first (yyyy-mm-dd)
  d <- suppressWarnings(ymd(x))
  # Try DD-Mon-YY  e.g. "01-Jul-21"
  na_idx <- is.na(d)
  d[na_idx] <- suppressWarnings(dmy(x[na_idx]))
  # Try MM-DD-YY  e.g. "05-09-23"
  na_idx <- is.na(d)
  d[na_idx] <- suppressWarnings(mdy(x[na_idx]))
  return(d)
}

df$Enrollment_Date <- parse_dates(df$Enrollment_Date)

# Flag implausible enrollment years (before 2000 or after 2025)
year_val <- year(df$Enrollment_Date)
df$Enrollment_Date[!is.na(year_val) &
                     (year_val < 2000 | year_val > 2025)] <- NA


# 12. Clean Total_Payments
# Values contain currency symbols ($, £, ?, ₦, spaces, commas).
# Strip everything except digits and decimal points, then convert
# to numeric.
df$Total_Payments <- str_trim(df$Total_Payments)
df$Total_Payments[df$Total_Payments == ""] <- NA

df$Total_Payments <- gsub("[^0-9\\.]", "", df$Total_Payments)
df$Total_Payments[df$Total_Payments == ""] <- NA
df$Total_Payments <- as.numeric(df$Total_Payments)


# Remove rows with any missing values
df <- df %>%
  filter(
    !is.na(Student_ID) & Student_ID != "",
    !is.na(First_Name) & First_Name != "",
    !is.na(Last_Name) & Last_Name != "",
    !is.na(Age),
    !is.na(Gender) & Gender != "",
    !is.na(Course) & Course != "",
    !is.na(Enrollment_Date),
    !is.na(Total_Payments)
  )

# 14. Remove duplicate rows
# Drop exact duplicates across all 8 columns.
df <- distinct(df)

df <- df %>%
  group_by(Student_ID) %>%
  filter(is.na(Student_ID) | row_number() == 1) %>%
  ungroup()


# 15. Reorder columns & sort
df <- df %>%
  select(Student_ID, First_Name, Last_Name, Age, Gender,
         Course, Enrollment_Date, Total_Payments) %>%
  arrange(as.numeric(Student_ID))


# 16. Export cleaned data
write.csv(df, "D:/Repos/DS_TEB2043/Lab Project/Cleaned Dataset.csv", row.names = FALSE, na = "")

cat("✔ Cleaning complete. Rows in raw data:", nrow(df_raw),
    "| Rows after cleaning:", nrow(df), "\n")
cat("✔ File saved as: Cleaned data.csv\n")