//
//  HomeViewController.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController, HomeViewInterface {
    var presenter: HomeViewDelegateInterface?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeController {
    @IBAction func didTapOpenNotifications(_ sender: Any) {
        presenter!.didPressOpenNotifications()
    }
}
