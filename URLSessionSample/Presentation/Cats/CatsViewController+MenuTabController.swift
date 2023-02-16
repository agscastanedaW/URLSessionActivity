//
//  CatsViewController+MenuTabController.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import UIKit

extension CatsViewController: MenuTabController {
    var item: MenuTabItem { .cats }
    
    func setTabBarItem() {
        setTabBarItem(title: "Cats",
                      unselected: UIImage(systemName: "heart") ?? UIImage(),
                      selected: UIImage(systemName: "heart.fill") ?? UIImage())
    }
}
