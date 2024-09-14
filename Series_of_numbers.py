# Define the series of 15 letters
series = "abcdeabcdeabcde"  # Replace with your 15-letter series

# Initialize an empty dictionary to store the count of each letter
letter_count = {}

# Iterate through each letter in the series
for letter in series:
    if letter in letter_count:
        letter_count[letter] += 1
    else:
        letter_count[letter] = 1

# Display the count of each letter
for letter, count in letter_count.items():
    print(f"Letter '{letter}' repeats {count} times.")
