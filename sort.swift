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


// level 1
var af1 = [String]()
var gm1 = [String]()
var ns1 = [String]()
var tz1 = [String]()
let lvl1 = alp(0,af1,gm1,ns1,tz1,words)

// level 2 a-f
var aa = [String]()
var ag = [String]()
var an = [String]()
var at = [String]()
let lvl20 = alp(1,aa,ag,an,at,lvl1[0])

// level 2 g-m
var ga = [String]()
var gg = [String]()
var gn = [String]()
var gt = [String]()
let lvl21 = alp(1, ga,gg,gn,gt,lvl1[1])

// level 2 n-s
var na = [String]()
var ng = [String]()
var nn = [String]()
var nt = [String]()
let lvl22 = alp(1, na,ng,nn,nt,lvl1[2])

// level 2 t-z
var ta = [String]()
var tg = [String]()
var tn = [String]()
var tt = [String]()
let lvl23 = alp(1, ta,tg,tn,tt,lvl1[3])

func appendArray(inputArray: [String], outputArray:inout [String]) {
    let sorted = sort(words:inputArray)
    var x = 0
    for i in sorted {
        if sorted.indices.contains(x){ 
            outputArray.append(i)}
        x += 1
    }
}
var finalArray = [String]()
for i in lvl20 {
    appendArray(inputArray: i, outputArray:&finalArray)
    }

for i in lvl21 {
    appendArray(inputArray: i, outputArray:&finalArray) 
    
    }

for i in lvl22 {
   
    appendArray(inputArray: i, outputArray:&finalArray)   
   
}
for i in lvl23 {
 
 
    appendArray(inputArray: i, outputArray:&finalArray) 
}
//print("DIVIDE RESULT")
//for word in finalArray {
  //  print(word)
//}

print("FINAL RESULT")
// print the final result
finalArray = sort(words: words)
for word in finalArray {
    print(word)
}

//print("level 1:")
// print(lvl1)
// print("level 2-0:")
// print(lvl20)
// print("level 2-1:")
// print(lvl21)
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

func alp(_ index: Int, _ af: [String], _ gm: [String], _ ns: [String], _ tz: [String], _ words: [String]) -> [[String]] {
    let i = index
    var afnew = af
    var gmnew = gm
    var nsnew = ns
    var tznew = tz
    
    for word in words {
        if word.count > i {
            if "a" <= word[word.index(word.startIndex, offsetBy:i)] && word[word.index(word.startIndex, offsetBy:i)] <= "f" {
                afnew.append(word)
            }else if "g" <= word[word.index(word.startIndex, offsetBy:i)] && word[word.index(word.startIndex, offsetBy:i)] <= "m" {
                gmnew.append(word)
            }else if "n" <= word[word.index(word.startIndex, offsetBy:i)] && word[word.index(word.startIndex, offsetBy:i)] <= "s" {
                nsnew.append(word)
            }else if "t" <= word[word.index(word.startIndex, offsetBy:i)] && word[word.index(word.startIndex, offsetBy:i)] <= "z" {
                tznew.append(word)
            }
        }
    }
    //print(afnew)
    //print(gmnew)
    //print(nsnew)
    //print(tznew)

    return [afnew, gmnew, nsnew, tznew]
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
