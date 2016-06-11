//
//  NetworkController.swift
//  Sockeys
//
//  Created by wangsw on 6/11/16.
//  Copyright © 2016 beanandbean. All rights reserved.
//

import Foundation

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
    
}