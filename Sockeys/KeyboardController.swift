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
    
    var keys = [String]()
    var modifiers = [String]()
    
    func keyDown(key: String) {
        assert(!keys.contains(key) && !modifiers.contains(key))
        keys.append(key)
    }
    
    func keyUp(key: String) {
        if keys.contains(key) {
            modifiers.appendContentsOf(keys)
            keys = [String]()
            let keyString = modifiers.joinWithSeparator("+")
            modifiers.removeAtIndex(modifiers.indexOf(key)!)
            if NetworkController.defaultController().connected {
                NetworkController.defaultController().send(keyString)
            }
        } else if modifiers.contains(key) {
            modifiers.removeAtIndex(modifiers.indexOf(key)!)
        } else {
            assertionFailure()
        }
    }
    
}
