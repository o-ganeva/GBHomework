import Foundation

struct Queue<T> {
    
    private var elements: [T] = []
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
    
    subscript(index: Int) -> T? {
        return index < elements.count ? elements[index] : nil
    }
    
    func filter(predicate: (T) -> Bool) -> Queue<T> {
        var filteredQueue = Queue<T>()
        for element in elements {
            if predicate(element) {
                filteredQueue.enqueue(element)
            }
        }
        return filteredQueue
    }
    
    func map(predicate: (T) -> T?) -> Queue<T?> {
        var mappedQueue = Queue<T?>()
        for element in elements {
            let newElement = predicate(element)
            mappedQueue.enqueue(newElement)
        }
        return mappedQueue
    }
}

var queue = Queue<Int>()

queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)

queue.dequeue()
queue.dequeue()

let mappedQueue = queue.map { element in
    element + 1
}

print(mappedQueue)

let filteredQueue = queue.filter { $0 % 2 == 0 }
print(filteredQueue)

print(filteredQueue[1])
