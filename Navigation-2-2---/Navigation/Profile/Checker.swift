//
//  Checker.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 23.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class Checker {
    private init () { }
    
    static let checker = Checker()
    
    private(set) var login = "Baby Yoda".hash
    private(set) var password = "password".hash
}
