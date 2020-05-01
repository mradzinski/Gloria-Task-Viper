//
//  ProfilePresenter.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

final class ProfilePresenter: ProfileViewDelegateInterface {
    internal var _wireframe: ProfileWireframeInterface
    internal unowned var _view: ProfileViewInterface
    internal var _interactor: ProfileInteractorInputInterface?
    
    init(wireframe: ProfileWireframeInterface, view: ProfileViewInterface, interactor: ProfileInteractorInputInterface? = nil) {
        self._wireframe = wireframe
        self._view = view
        self._interactor = interactor
        self._interactor?.presenter = self
    }
    
    func getUserForProfile(_ id: Int) {
        self._interactor?.getUser(id)
    }
    
    func didPressOnBackButton() {
        self._wireframe.dismissViewController()
    }
}

extension ProfilePresenter: ProfileInteractorOutputInterface {
    func didGetUser(_ user: User) {
        self._view.showProfile(user)
    }
}
