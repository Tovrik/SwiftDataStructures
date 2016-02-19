//
//  Queue.swift
//  
//
//  Created by Stefan Peterson on 2/1/16.
//
//

struct Queue<T> {
    private var items = [T]()
    
    // Variable that holds the current front of the queue, or returns
    // nil if queue is empty
    public var front: T? {
        return items.isEmpty ? nil : items[0]
    }
    
    // Variable that holds the current back of the queue, or returns
    // nil if queue is empty
    public var back: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
    // Pushes a new item onto the queue
    //
    // Paramter (item): item to be pushed
    public mutating func push(item: T) {
        items.append(item)
    }
    
    // Pops the first item in the array and returns it
    //
    // Returns: item at the front of the queue
    public mutating func pop() -> T {
        return items.removeAtIndex(0)
    }

    // Determines if queue is empty
    //
    //Returns: true if empty, false if not empty
    public func empty() -> Bool {
        return items.isEmpty
    }
    
    //Determines size of queue
    //
    // Returns: an integer stating the number of items in the queue
    public func size() -> Int {
        return items.count
    }
}