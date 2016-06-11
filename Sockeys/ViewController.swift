//
//  ViewController.swift
//  Sockeys
//
//  Created by wangsw on 6/10/16.
//  Copyright © 2016 beanandbean. All rights reserved.
//

import UIKit

let ROWS: CGFloat = 6
let COLUMNS: CGFloat = 14.5
let INSET: CGFloat = 0.05
var BUTTON_SIZE: CGFloat!
var SCREEN_HEIGHT: CGFloat!

func Rect(row row: CGFloat, col: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
    return CGRect(x: (col + INSET * 2) * BUTTON_SIZE, y: SCREEN_HEIGHT - (ROWS - row) * BUTTON_SIZE, width: (width - INSET * 2) * BUTTON_SIZE, height: (height - INSET * 2) * BUTTON_SIZE)
}

class ViewController: UIViewController {
    
    var buttons: [KeyButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        BUTTON_SIZE = view.frame.size.width / (COLUMNS + INSET * 2)
        SCREEN_HEIGHT = view.frame.size.height
        
        let row0_width = COLUMNS / 13
        let row0_height: CGFloat = 0.8
        let esc = KeyButton(frame: Rect(row: 1 - row0_height, col: 0, width: row0_width, height: row0_height), text: "Esc", value: "Escape")
        view.addSubview(esc)
        for index in 1 ..< 13 {
            let key = KeyButton(frame: Rect(row: 1 - row0_height, col: CGFloat(index) * row0_width, width: row0_width, height: row0_height), text: String(format: "F%d", index), value: String(format: "F%d", index))
            view.addSubview(key)
        }
        let row1 = ["~\n`", "!\n1", "@\n2", "#\n3", "$\n4", "%\n5", "^\n6", "&\n7", "*\n8", "(\n9", ")\n0", "_\n-", "+\n="]
        let row1Values = ["grave", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "minus", "equal"]
        for index in 0 ..< row1.count {
            let key = KeyButton(frame: Rect(row: 1, col: CGFloat(index), width: 1, height: 1), text: row1[index], value: row1Values[index])
            view.addSubview(key)
        }
        let delete = KeyButton(frame: Rect(row: 1, col: 13, width: 1.5, height: 1), text: "Delete", value: "BackSpace")
        view.addSubview(delete)
        let tab = KeyButton(frame: Rect(row: 2, col: 0, width: 1.5, height: 1), text: "Tab", value: "Tab")
        view.addSubview(tab)
        let row2 = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "{\n[", "}\n]", "|\n\\"]
        let row2Values = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "bracketleft", "bracketright", "backslash"]
        for index in 0 ..< row2.count {
            let key = KeyButton(frame: Rect(row: 2, col: CGFloat(index) + 1.5, width: 1, height: 1), text: row2[index], value: row2Values[index])
            view.addSubview(key)
        }
        let capsLock = KeyButton(frame: Rect(row: 3, col: 0, width: 1.75, height: 1), text: "Caps Lock", value: "Caps_Lock")
        view.addSubview(capsLock)
        let row3 = ["A", "S", "D", "F", "G", "H", "J", "K", "L", ":\n;", "\"\n'"]
        let row3Values = ["a", "s", "d", "f", "g", "h", "j", "k", "l", "semicolon", "apostrophe"]
        for index in 0 ..< row3.count {
            let key = KeyButton(frame: Rect(row: 3, col: CGFloat(index) + 1.75, width: 1, height: 1), text: row3[index], value: row3Values[index])
            view.addSubview(key)
        }
        let enter = KeyButton(frame: Rect(row: 3, col: 12.75, width: 1.75, height: 1), text: "Enter", value: "Return")
        view.addSubview(enter)
        let leftShift = KeyButton(frame: Rect(row: 4, col: 0, width: 2.25, height: 1), text: "Shift", value: "Shift_L")
        view.addSubview(leftShift)
        let row4 = ["Z", "X", "C", "V", "B", "N", "M", "<\n,", ">\n.", "?\n/"]
        let row4Values = ["z", "x", "c", "v", "b", "n", "m", "comma", "period", "slash"]
        for index in 0 ..< row4.count {
            let key = KeyButton(frame: Rect(row: 4, col: CGFloat(index) + 2.25, width: 1, height: 1), text: row4[index], value: row4Values[index])
            view.addSubview(key)
        }
        let rightShift = KeyButton(frame: Rect(row: 4, col: 12.25, width: 2.25, height: 1), text: "Shift", value: "Shift_R")
        view.addSubview(rightShift)
        let leftCtrl = KeyButton(frame: Rect(row: 5, col: 0, width: 1, height: 1), text: "Ctrl", value: "Ctrl_L")
        view.addSubview(leftCtrl)
        let leftAlt = KeyButton(frame: Rect(row: 5, col: 1, width: 1, height: 1), text: "Alt", value: "Alt_L")
        view.addSubview(leftAlt)
        let space = KeyButton(frame: Rect(row: 5, col: 2, width: 10.5, height: 1), text: "Space", value: "space")
        view.addSubview(space)
        let rightAlt = KeyButton(frame: Rect(row: 5, col: 12.5, width: 1, height: 1), text: "Alt", value: "Alt_R")
        view.addSubview(rightAlt)
        let rightCtrl = KeyButton(frame: Rect(row: 5, col: 13.5, width: 1, height: 1), text: "Ctrl", value: "Ctrl_R")
        view.addSubview(rightCtrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

