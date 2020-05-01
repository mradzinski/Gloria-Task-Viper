//
//  UITableView+Extensions.swift
//  gloria
//
//  Created by Matias Radzinski on 4/24/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit

fileprivate var _topSeparatorTag = 1987 // choose unused tag

extension UITableView {

    fileprivate var _topSeparator: UIView? {
        return superview?.subviews.filter { $0.tag == _topSeparatorTag }.first
    }

    override open var contentOffset: CGPoint {
        didSet {
            guard let topSeparator = _topSeparator else { return }

            let shouldDisplaySeparator = contentOffset.y > 0

            if shouldDisplaySeparator && topSeparator.alpha == 0 {
                UIView.animate(withDuration: 0.15, animations: {
                    topSeparator.alpha = 1
                })
            } else if !shouldDisplaySeparator && topSeparator.alpha == 1 {
                UIView.animate(withDuration: 0.25, animations: {
                    topSeparator.alpha = 0
                })
            }
        }
    }

    // Adds a separator to the superview at the top of the table
    // This needs the separator insets to be set on the tableView, not the cell itself
    func showTopSeparatorWhenScrolled(_ enabled: Bool) {
        if enabled {
            if _topSeparator == nil {
                let topSeparator = UIView()
                topSeparator.backgroundColor = separatorColor?.withAlphaComponent(0.85)
                topSeparator.translatesAutoresizingMaskIntoConstraints = false

                superview?.addSubview(topSeparator)

                topSeparator.leftAnchor.constraint(equalTo: self.leftAnchor, constant: separatorInset.left).isActive = true
                topSeparator.rightAnchor.constraint(equalTo: self.rightAnchor, constant: separatorInset.right).isActive = true
                topSeparator.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                let onePixelInPoints = CGFloat(1) / UIScreen.main.scale
                topSeparator.heightAnchor.constraint(equalToConstant: onePixelInPoints).isActive = true

                topSeparator.tag = _topSeparatorTag
                topSeparator.alpha = 0

                superview?.setNeedsLayout()
            }
        } else {
            _topSeparator?.removeFromSuperview()
        }
    }

    func removeSeparatorsOfEmptyCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }
}
