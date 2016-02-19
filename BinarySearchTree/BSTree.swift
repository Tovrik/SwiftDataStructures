//
//  BSTree.swift
//  
//
//  Created by Stefan Peterson on 2/15/16.
//
//

class BSTree<T: Comparable> {
    private var value: T?
    private var left: BSTree<T>? // left child
    private var right: BSTree<T>? // right child

    // Adds a node to the tree
    //
    // Parameters (value): value to be added to the tree
    public func add(value: T) {
        if self.value == nil {
            self.value = value
            return
        }
        if value < self.value {
            if let left = self.left {
                left.add(value)
            } else {
                let lChild = BSTree<T>()
                lChild.value = value
                self.left = lChild
            }
        } else if value > self.value {
            if let right = self.right {
                right.add(value)
            } else {
                let rChild = BSTree<T>()
                rChild.value = value
                self.right = rChild
            }
        }
    }

    // Removes a node from the tree
    //
    // Parameters (value): value to be removed from the tree
    public func remove(value: T) {
        var found = false
        var current: BSTree<T> = self
        var prev: BSTree<T>

        while current.value != nil {
            if current.value == value {
                found = true
                break
            } else {
                prev = current
                if value < current.value {
                    current = current.left!
                } else {
                    current = current.right!
                }
            }
        }
        if (current.left == nil && current.right != nil) || (current.left != nil && current.right == nil) {

        }
    }
    
    
    // Finds a value in the tree and returns true if it exists
    //
    // Parameters (value): value to be located
    // Returns: true if value exists, false if it doesn't exist
    public func search(value: T) -> Bool {
        switch self.value {
        case nil:
            return false
        case _ where self.value == value:
            return true
        case _ where value < self.value:
            if let left = self.left {
                return left.search(value)
            }
            fallthrough
        case _ where value > self.value:
            if let right = self.right {
                return right.search(value)
            }
            fallthrough
        default:
            return false
        }
    }

    // Traverses the tree and applies a passed function to each node in the tree
    //
    // Parameters (closure): function to be applied to each node
    public func traverse() { //closure: (node: BSTree<T>) -> Void) {
        if self.value == nil {
            return
        }
        if let left = self.left {
            left.traverse()
        }
        print(self.value)
        //closure(node: self)
        if let right = self.right {
            right.traverse()
        }
    }
}