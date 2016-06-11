//
//  Key.swift
//  Sockeys
//
//  Created by wangsw on 6/10/16.
//  Copyright © 2016 beanandbean. All rights reserved.
//

import UIKit

class KeyButton: UIButton {
    
    let value: String
    var lock_on = false
    
    init(frame: CGRect, text: String, value: String) {
        self.value = value
        super.init(frame: frame)
        titleLabel?.lineBreakMode = .ByWordWrapping
        titleLabel?.textAlignment = .Center
        setTitle(text, forState: .Normal)
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        layer.borderColor = UIColor.blackColor().CGColor
        layer.borderWidth = 3
        layer.cornerRadius = frame.size.height / 10
        addTarget(self, action: #selector(KeyButton.keyDown), forControlEvents: .TouchDown)
        addTarget(self, action: #selector(KeyButton.keyUp), forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func keyDown() {
        KeyboardController.defaultController().keyDown(value)
        backgroundColor = UIColor.grayColor()
    }
    
    func keyUp() {
        KeyboardController.defaultController().keyUp(value)
        if value == "Caps_Lock" {
            lock_on = !lock_on
            if lock_on {
                backgroundColor = UIColor.grayColor()
            } else {
                backgroundColor = UIColor.whiteColor()
            }
        } else {
            backgroundColor = UIColor.whiteColor()
        }
    }
    
}
