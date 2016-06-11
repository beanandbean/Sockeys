//
//  KeyboardController.swift
//  Sockeys
//
//  Created by wangsw on 6/11/16.
//  Copyright © 2016 beanandbean. All rights reserved.
//

import Foundation

var g_defaultKeyboardController: KeyboardController?

class KeyboardController {
    
    class func defaultController() -> KeyboardController {
        if let con = g_defaultKeyboardController {
            return con
        } else {
            g_defaultKeyboardController = KeyboardController()
            return g_defaultKeyboardController!
        }
    }
    
    var keys = Set<String>()
    var modifiers = Set<String>()
    
    func keyDown(key: String) {
        assert(!keys.contains(key) && !modifiers.contains(key))
        assert(modifiers.isDisjointWith(keys))
        keys.insert(key)
    }
    
    func keyUp(key: String) {
        assert(keys.contains(key) || modifiers.contains(key))
        assert(modifiers.isDisjointWith(keys))
        if keys.contains(key) {
            modifiers.unionInPlace(keys)
            keys = Set<String>()
            let keyString = modifiers.joinWithSeparator("+")
            modifiers.remove(key)
            print(keyString)
        } else if modifiers.contains(key) {
            modifiers.remove(key)
        }
    }
    
}
