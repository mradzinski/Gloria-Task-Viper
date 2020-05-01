//
//  AboutInterfaces.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

protocol AboutWireframeInterface: WireframeInterface {
}

protocol AboutViewInterface: ViewInterface {
    var presenter: AboutViewDelegateInterface? { get set }
}

protocol AboutViewDelegateInterface: PresenterInterface {
    var _wireframe: AboutWireframeInterface { get }
    var _view: AboutViewInterface { get }
}
