var words = ["aaa", "afaa", "azaa", "donkey", "apple", "lala"]

var testword1 = "hello"
var testword2 = "hellp"

//print(testword1 > testword2)

print(shouldSwap(stringA:testword1, stringB:testword2))

func shouldSwap(stringA: String, stringB: String) -> Bool {
    let word1 = stringA.lowercased().filter("abcdefghijklmnopqrstuvwxyz".contains)
    let word2 = stringB.lowercased().filter("abcdefghijklmnopqrstuvwxyz".contains)

    return word1.lowercased() > word2.lowercased()
}
