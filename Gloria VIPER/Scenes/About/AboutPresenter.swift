//
//  AboutPresenter.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

final class AboutPresenter: AboutViewDelegateInterface {
    internal var _wireframe: AboutWireframeInterface
    internal unowned var _view: AboutViewInterface
    
    init(wireframe: AboutWireframeInterface, view: AboutViewInterface) {
        self._wireframe = wireframe
        self._view = view
    }
}
