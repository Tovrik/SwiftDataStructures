//
//  Stack.swift
//  
//
//  Created by Stefan Peterson on 2/15/16.
//
//

struct Stack<T> {
    private var items = [T]()
    
    // Variable that holds the current top item or nil if empty
    var top: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
    // Pushes a new item onto the stack
    //
    // Parameter (item): item to be pushed
    public mutating func push(item: T) {
        items.append(item)
    }
    
    // Pops the last item in the array off and returns it
    //
    // Returns: item at the top of the stack
    public mutating func pop() -> T {
        return items.removeLast()
    }

    // Determines if stack is empty
    //
    // Returns: true if empty, false if not empty
    public func empty() -> Bool {
        return items.isEmpty
    }

    // Determines size of stack
    //
    // Returns: an integer stating the number of items in the stack
    public func size() -> Int {
        return items.count
    }
}