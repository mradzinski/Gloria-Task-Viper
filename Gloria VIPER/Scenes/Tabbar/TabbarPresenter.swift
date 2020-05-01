//
//  TabbarPresenter.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

final class TabbarPresenter: TabbarViewDelegateInterface {
    internal var _wireframe: TabbarWireframeInterface
    internal unowned var _view: TabbarViewInterface
    internal var _interactor: TabbarInteractorInterface?
    
    init(wireframe: TabbarWireframeInterface, view: TabbarViewInterface, interactor: TabbarInteractorInterface? = nil) {
        self._wireframe = wireframe
        self._view = view
        self._interactor = interactor
    }
}
