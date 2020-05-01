//
//  ProfileController.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit
import Hero

final class ProfileController: UIViewController {
    fileprivate let spacing: CGFloat = 10.0
    
    var presenter: ProfileViewDelegateInterface?
    var userId: Int?
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var videoCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHero()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let userId = self.userId {
            presenter?.getUserForProfile(userId)
        }
    }
    
    func setupHero() {
        self.hero.isEnabled = true
        self.hero.modalAnimationType = .fade
        
        userImageView.hero.id = "\(heroIdForThumbnails)\(userId ?? -1)"
        
        userImageView.hero.modifiers = [.timingFunction(.deceleration), .duration(0.2)]
        
        collectionView.hero.modifiers = [
            .cascade,
            .delay(0.2),
            .duration(0.2),
            .whenDismissing(
                .delay(0),
                .translate(x: 0, y: 500, z: 0)
            )
        ]
    }
}

extension ProfileController: ProfileViewInterface {
    func showProfile(_ user: User) {
        userImageView.image = UIImage(named: user.profilePicture)
        videoCountLabel.text = "\(user.uploadedVideosCount) Videos"
        followersCountLabel.text = "\(user.followersCount) Followers"
        followingCountLabel.text = "\(user.followingCount) Following"
    }
}

extension ProfileController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        
        cell.hero.modifiers = [.fade, .scale(0.5), .duration(0.15)]
        
        return cell
    }
}

extension ProfileController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 7
        
        let totalSpacing = (2 * (spacing + 2)) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing) / numberOfItemsPerRow
            return CGSize(width: width, height: width)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
}

extension ProfileController {
    @IBAction func didPressBackButton(_ sender: Any) {
        presenter?.didPressOnBackButton()
    }
}
