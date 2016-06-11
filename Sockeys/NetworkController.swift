//
//  NetworkController.swift
//  Sockeys
//
//  Created by wangsw on 6/11/16.
//  Copyright © 2016 beanandbean. All rights reserved.
//

import Foundation
import FastSocket

var g_defaultNetworkController: NetworkController?

class NetworkController {
    
    class func defaultController() -> NetworkController {
        if let con = g_defaultNetworkController {
            return con
        } else {
            g_defaultNetworkController = NetworkController()
            return g_defaultNetworkController!
        }
    }
    
    var socket: FastSocket!
    var connected = false
    
    func connect(host: String, port: String) -> String? {
        assert(!connected)
        socket = FastSocket(host: host, andPort: port)
        if socket.connect() {
            connected = true
            return nil
        } else {
            return socket.lastError.description
        }
    }
    
    func send(msg: String) {
        assert(connected)
        let data = (msg + "\n").dataUsingEncoding(NSUTF8StringEncoding)!
        socket.sendBytes(data.bytes, count: data.length)
    }
    
    func disconnect() {
        assert(connected)
        socket.close()
        connected = false
    }
    
}