/ \l find_highest_number_of_occurences_using_dict.q
/ input string
s: "string hello 1 2 3"
show enlist["Input String : ", s]

/ filter alpha numeric characters
alphaNumericChars: s where s in "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

show enlist["Alpha Numeric String : ", s]

/ Split string into list of characters
chars: enlist each alphaNumericChars

/ Group the characters
groupedChars: group chars

/ Count the occurrences of each character
charCounts: count each groupedChars

/ Extract the keys and values
charKeys: first each key groupedChars
charValues: value charCounts

/ Create a dictionary
charDict: charKeys!charValues

/ Find the character with the highest count
maxCount: max value charDict
maxChar: first where charDict = maxCount

/ show (maxChar; maxCount)

show enlist["Char : ", maxChar, " , ", "Max Count : ", string maxCount]
