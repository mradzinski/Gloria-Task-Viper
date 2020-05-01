//
//  ProfileInteractor.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

final class ProfileInteractor: ProfileInteractorInputInterface {
    var presenter: ProfileInteractorOutputInterface?
    
    func getUser(_ id: Int) {
        if let user = DataSource.getUserById(id) {
            presenter?.didGetUser(user)
        }
    }
}
