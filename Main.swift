//1. Assign a text to a string variable. The text must be in English. Source: https://exyte.com/blog/introduciton-to-swift
var myText : String = "First  released in 2014, Swift is a powerful general-purpose programming language for the Apple ecosystem. Whether you need to develop for iOS or any of the surrounding operating systems like macOS, tvOS, and others, it will be one of the main tools in your toolbelt.\nSwift is focused on safety and clarity. By design, Swift eliminates certain classes of unsafe code that are still allowed in languages like JavaScript. Therefore, it enables developers to catch some bugs at compile time before shipping them out to the users.\nOn the other side, Swift’s clear and expressive syntax enables developers to write more concise programs than in languages like Java or C++.\nWhile it’s being used mainly for Apple products, Swift has recently got some market share in areas like machine learning and web. For example, TensorFlow added Swift support because of the increased speed and type safety over Python, while server-side web frameworks like Vapor and Kitura are slowly gaining popularity."
print("1. Text selected:", myText, "\n")

//2. Assign a letter to a character variable.
var myChar : Character = "e"
print("2. Letter assigned to character variable:", myChar, "\n")

//3. Print the number of words in the text.

// We assume that first character is not a punctuation character
var isTraversingWord : Bool = true
var wordsArray : [String] = []
var currentWord : String = ""

for character in myText { 
  let isPuntuationCharacter = (character == " " || character == "," || character == "." || character == "!" || character == "\n")

  if isPuntuationCharacter {
    if !currentWord.isEmpty {
      // If we encounter a punctuation character and our current word has at least one character, then we are not traversing a word anymore
      wordsArray.append(currentWord)
      currentWord = ""
      isTraversingWord = false
    } 
  } else {
    // If we do not encounter a punctuation character, then we are traversing a word
    isTraversingWord = true
  }

  if isTraversingWord {
    // If we are traversing a word then we should add the character to the current word
    currentWord += String(character)
  }
}

//print(wordsArray) // Prints all words in the text
print("3. Number of words:", wordsArray.count, "\n")

//4. Print the number of occurrences of the word "and" in the text.
var wordCounter : Int = 0

for word in wordsArray {
  if word.lowercased() == "and" {
    wordCounter += 1
  }
}

print("4. Number of ocurrences of the word \"and\" in the text: \(wordCounter)\n")

//5. Print the longest word in the text. If there is more than one word with the same maximum length, just print one word.
var maxWordLength : Int = 0
var maxWord : String = ""

for word in wordsArray {
  if word.count > maxWordLength {
    maxWordLength = word.count
    maxWord = word
  }
}
    

print("5. Longest word in the text is: \"\(maxWord)\" with \(maxWordLength) characters\n")

//6. Print the shortest word in the text. If there is more than one word with the same minimum length, just print one word.
var minWordLength : Int = Int.max
var minWord : String = ""

for word in wordsArray {
  if word.count < minWordLength {
    minWordLength = word.count
    minWord = word
  }
}

print("6. Shortest word in the text is: \"\(minWord)\" with \(minWordLength) characters\n")

//7. Construct and present a string that contains all the words that start with the letter contained in the character variable, separated by dots "."
var allMatchesString : String = ""

for word in wordsArray {
  if word[word.startIndex] == myChar {
    // If first character of word is the same as the elected character, then add it to the string followed by a point
    allMatchesString += word + "."
  }
}

// Erasing last point
allMatchesString.removeLast()

print("7. String containing all the words that start with \(myChar):\n\(allMatchesString)")