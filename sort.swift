// define initial array
var words = [String]()

// ask user for words to add to array
print("Enter a word to add to the list of words to sort. Once finished adding all words, press ENTER. ", terminator:"")
var line = readLine()
while line != nil && line != "" && line != " " {
    words.append(line!)
    print("Enter a word to add to the list of words to sort. Once finished adding all words, press ENTER. ", terminator:"")
    line = readLine()
}

// print the final result
let sortedArray = sort(words: words)
for word in sortedArray {
    print(word)
}

// checks if 2 words should be swapped
func shouldSwap(stringA: String, stringB: String) -> Bool {
    let word1 = stringA.lowercased().filter("abcdefghijklmnopqrstuvwxyz".contains)
    let word2 = stringB.lowercased().filter("abcdefghijklmnopqrstuvwxyz".contains)

    return word1.lowercased() > word2.lowercased()
}

// sorts an array and returns the sorted array
func sort(words: [String]) -> [String] {
    var wordList = words
    var didSwap = false
    repeat {
        didSwap = false
        for i in 1 ..< wordList.count {
            if shouldSwap(stringA: wordList[i-1], stringB: wordList[i]) {
                swap(words:&wordList, index1:i-1, index2:i)
                didSwap = true
            }
        }
    } while didSwap == true
    return wordList
}

// swap position of two values in an array
func swap(words:inout [String], index1: Int, index2: Int) {
    let word1 = words[index1]
    let word2 = words[index2]

    words[index1] = word2
    words[index2] = word1
}
