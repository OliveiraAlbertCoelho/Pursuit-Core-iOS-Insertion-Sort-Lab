import Foundation

// Question One
// Implement insertion sort that accepts a closure about how to sort elements
func insert<T>(_ newElement: T, into sortedArr: [T], by isSorted: (T,T) -> Bool) -> [T] {
    var sortedArr = sortedArr
    for (index, element) in sortedArr.enumerated(){
        if isSorted(newElement, element){
            sortedArr.insert(newElement, at: index)
            return sortedArr
        }
    }
    sortedArr.append(newElement)
    return sortedArr
}
func insertionSorted<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var sortedArr = [T]()
    for element in arr{
        sortedArr = insert(element, into: sortedArr, by: isSorted)
    }
    return sortedArr
}


// Question Two
// Sort an array of Ints using insertion sort without changing the position of any negative numbers
// https://www.geeksforgeeks.org/sort-an-array-without-changing-position-of-negative-numbers/
func insertionSortWithoutMovingNegatives<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    let zero = 0 as! T
    var positiveArr = [T]()
    var sortedArr = [T]()
    for i in arr{
        if i >= zero {
            positiveArr.append(i)
        }
    }
    for i in positiveArr{
        sortedArr = insert(i, into: sortedArr, by: isSorted)
    }
    for (k,v) in arr.enumerated(){
        if v < zero{
            sortedArr.insert(v, at: k)
        }
    }
    return sortedArr
}

// Question Three
// Implement insertion sort in place
func insertionSort<T: Comparable>(arr: inout [T], by isSorted: (T, T) -> Bool) -> [T] {
      for indexOne in 1..<arr.count{
        print("Index One = \(indexOne)")
        var indexTwo = indexOne
        while indexTwo > 0 && !isSorted(arr[indexTwo-1], arr[indexTwo]){
            print(arr)
            arr.swapAt(indexTwo - 1, indexTwo)
            indexTwo -= 1
        }
    }
    return arr
}

// Question Four
// Implement insertion sort on a linked list
func insertionSorted<T: Comparable>(list: LinkedList<T>, by isSorted: (T, T) -> Bool) -> LinkedList<T> {
    return list
}

