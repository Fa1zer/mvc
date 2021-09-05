//
//  FeedViewControllerModel.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 03.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation


class FeedViewControllerModel {
    private let password = "Password"
    
    func check(word: String) -> Bool {
        if password == word {
            return true
        }
        
        return false
    }
}
