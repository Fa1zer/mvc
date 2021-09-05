//
//  TapBarController.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 05.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let controllers = [FirstNavigationController(), SecondNavigationController()]
        
        viewControllers = controllers
        
        selectedIndex = 1
        selectedIndex = 0
    }
}
