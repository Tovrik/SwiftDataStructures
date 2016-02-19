//
//  LinkedList.swift
//  
//
//  Created by Stefan Peterson on 2/1/16.
//
//



struct LinkedList<T: Equatable> {
    private var head = Node<T>() // head node
    private var size: Int = 0 //number of nodes in the linked list

    // Adds a new value to the end of the linked list and increments size
    //
    // Parameter (value): value to be added to the linked list
    public mutating func add(value: T) {
        if self.head.value == nil {
            self.head.value = value
        } else {
            var last = self.head
            while last.next != nil {
                last = last.next!
            }
            let new = Node<T>()
            new.value = value
            last.next = new
        }
        size += 1
    }

    // Adds a new value to the end of the linked list and decrements size
    //
    // Parameter (value): value to be removed from the linked list
    public mutating func remove(value: T) {
        if self.head.value == value {
            self.head = self.head.next!
        }
        if self.head.value != nil {
            var temp = self.head
            var prev = Node<T>()
            while temp.value != value && temp.next != nil {
                prev = temp
                temp = temp.next!
            }
            if temp.value == value {
                prev.next = temp.next
            } else {
                prev.next = nil
            }
        }
        size -= 1
    }

    // Gets the value stored at index in the linked list
    //
    // Parameter (index): index of the value to return
    public func get(index: Int) -> T? {
        if index > size || index < 0 { return nil }
        if index == 0 { return head.value }

        var temp = self.head
        for _ in 1...index {
            temp = temp.next!
        }
        return temp.value
    }

    // Looks at the value at the front of the linked list
    //
    // Returns: generic type of value at head
    public func peek() -> T? {
        return self.head.value
    }
}