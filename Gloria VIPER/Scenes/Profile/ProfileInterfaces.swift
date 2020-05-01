//
//  ProfileInterfaces.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

protocol ProfileWireframeInterface: WireframeInterface {
}

protocol ProfileViewInterface: ViewInterface {
    var presenter: ProfileViewDelegateInterface? { get set }
    
    func showProfile(_ user: User)
}

protocol ProfileViewDelegateInterface: PresenterInterface {
    var _wireframe: ProfileWireframeInterface { get }
    var _view: ProfileViewInterface { get }
    var _interactor: ProfileInteractorInputInterface? { get }
    
    func getUserForProfile(_ id: Int)
    func didPressOnBackButton()
}

protocol ProfileInteractorInputInterface: InputInteractorInterface {
    var presenter: ProfileInteractorOutputInterface? { get set }
    
    func getUser(_ id: Int)
}

protocol ProfileInteractorOutputInterface: OutputInteractorInterface {
    func didGetUser(_ user: User)
}
