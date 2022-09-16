// define initial array
var words = [String]()

// ask user for words to add to array
//print("Enter a word to add to the list of words to sort. Once finished adding all words, press ENTER. ", terminator:"")
var line = readLine()
while line != nil && line != "" && line != " " {
    words.append(line!)
    //print("Enter a word to add to the list of words to sort. Once finished adding all words, press ENTER. ", terminator:"")
    line = readLine()
}


// level 1
let empty = [String]()
let lvl1 = alp(0,empty,empty,empty,empty,empty,words)

var finalArray = [String]()


for i in lvl1 {
    for i2 in i {
        finalArray.append(i2)
    }
}

//print("INSERT RESULT")
for word in finalArray {
    print(word)
}


//print("level 1:")
//print(lvl1)
//print("level 2-0:")
//print(lvl20)
//print("level 2-1:")
//print(lvl21)
//print("level 2-2:")
//print(lvl22)
//print("level 2-3:")
//print(lvl23)

//sort through each level: tried making it so all variables above arent needed
// var sortIndex = 0
// var finalArray = [String]()
// for sorted in lvl1 {
//     for _ in 0 ..< getLongestWordCount(words){
//         var newSort = sorted
//         let empty = [String]()
//         let x = alp(sortIndex, empty, empty, empty, empty, newSort)
//         sortIndex += 1
//         print(x)
//         newSort = x
//     }
// }

func alp(_ index: Int, _ grp1: [String], _ grp2: [String], _ grp3: [String], _ grp4: [String], _ grp5: [String], _ words: [String]) -> [[String]] {
    let i = index
    var grp1new = grp1 //a-d
    var grp2new = grp2 //e-h
    var grp3new = grp3 //i-o
    var grp4new = grp4 //p-t
    var grp5new = grp5 //u-z

    
    for wordItem in words {
        let word = wordItem.lowercased().filter("abcdefghijklmnopqrstuvwxyz".contains)
        if word.count > i {
            if "a" <= word[word.index(word.startIndex, offsetBy:i)] && word[word.index(word.startIndex, offsetBy:i)] <= "d" {
                var insertIndex = grp1new.count - 1
                if grp1new.count == 0{
                    grp1new.append(word)
                }else{
                    var isInserted = false
                    while !isInserted {
                        if insertIndex < 0 {
                            grp1new.insert(word, at:0)
                            isInserted = true
                        }else if word > grp1new[insertIndex] {
                            grp1new.insert(word, at:insertIndex + 1)
                            isInserted = true
                        }else{
                            insertIndex -= 1
                        }
                    }
                }
            }else if "e" <= word[word.index(word.startIndex, offsetBy:i)] && word[word.index(word.startIndex, offsetBy:i)] <= "h" {
                var insertIndex = grp2new.count - 1
                if grp2new.count == 0{
                    grp2new.append(word)
                }else{
                    var isInserted = false
                    while !isInserted {
                        if insertIndex < 0 {
                            grp2new.insert(word, at:0)
                            isInserted = true
                        }else if word > grp2new[insertIndex] {
                            grp2new.insert(word, at:insertIndex + 1)
                            isInserted = true
                        }else{
                            insertIndex -= 1
                        }
                    }
                }
            }else if "i" <= word[word.index(word.startIndex, offsetBy:i)] && word[word.index(word.startIndex, offsetBy:i)] <= "o" {
                var insertIndex = grp3new.count - 1
                if grp3new.count == 0{
                    grp3new.append(word)
                }else{
                    var isInserted = false
                    while !isInserted {
                        if insertIndex < 0 {
                            grp3new.insert(word, at:0)
                            isInserted = true
                        }else if word > grp3new[insertIndex] {
                            grp3new.insert(word, at:insertIndex + 1)
                            isInserted = true
                        }else{
                            insertIndex -= 1
                        }
                    }
                }
            }else if "p" <= word[word.index(word.startIndex, offsetBy:i)] && word[word.index(word.startIndex, offsetBy:i)] <= "t" {
                var insertIndex = grp4new.count - 1
                if grp4new.count == 0{
                    grp4new.append(word)
                }else{
                    var isInserted = false
                    while !isInserted {
                        if insertIndex < 0 {
                            grp4new.insert(word, at:0)
                            isInserted = true
                        }else if word > grp4new[insertIndex] {
                            grp4new.insert(word, at:insertIndex + 1)
                            isInserted = true
                        }else{
                            insertIndex -= 1
                        }
                    }
                }
            }else if "u" <= word[word.index(word.startIndex, offsetBy:i)] && word[word.index(word.startIndex, offsetBy:i)] <= "z" {
                var insertIndex = grp5new.count - 1
                if grp5new.count == 0{
                    grp5new.append(word)
                }else{
                    var isInserted = false
                    while !isInserted {
                        if insertIndex < 0 {
                            grp5new.insert(word, at:0)
                            isInserted = true
                        }else if word > grp5new[insertIndex] {
                            grp5new.insert(word, at:insertIndex + 1)
                            isInserted = true
                        }else{
                            insertIndex -= 1
                        }
                    }
                }
            }
        }
    }
    //print(afnew)
    //print(gmnew)
    //print(nsnew)
    //print(tznew)

    return [grp1new, grp2new, grp3new, grp4new, grp5new]
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

func getLongestWordCount(_ words: [String]) -> Int {
    var initial = 0
    for word in words {
        if word.count > initial {
            initial = word.count
        }
    }
    return initial
}
