//
//  AboutController.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit

final class AboutController: UIViewController {
    var presenter: AboutViewDelegateInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AboutController: AboutViewInterface {
    
}
