//
//  TabbarController.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import UIKit
import MaterialComponents

final class TabbarController: MDCBottomNavigationBarController, TabbarViewInterface {
    var presenter: TabbarViewDelegateInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
