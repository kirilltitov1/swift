import Foundation

struct queue<Element_: Comparable> {
    
    var queueArray: [Element_] = []
//  +++++
    init(queueArray: Element_...) {
        self.queueArray = queueArray
    }
//  +++++
    mutating func addElementInQueue(addedElements: Element_...) {
        for i in addedElements {
            queueArray.append(i)
        }
    }
//  +++++
    func filterNums() -> [Int] {
        return queueArray.filter({$0 is Int}) as! [Int]
    }
//  +++++
    func evenElements() -> [Int] {
        return filterNums().filter{$0 % 2 == 0}
    }
//  +++++
    func sort<Type: Comparable>(arr: inout [Type]) {
        arr = arr.sorted {$0 < $1}
    }
//  эту штуку я взял у вас и полностью ее разобрал
//  indices - идет п индексам в порядке возрастания
//  contains - возвращает истину или ложь если содержится в диапазоне 
    subscript(index: Int) -> Any {
        return (queueArray.indices.contains(index) ? queueArray[index] as Any : "nil")
    }
}

var queue1: queue<Int> = queue.init(queueArray: 1,4)

queue1.addElementInQueue(addedElements: 1,5,6,7,8,12,4,5,14,7,8)
var t = queue1.evenElements()
queue1.sort(arr: &t)

print(queue1[3])

print()
