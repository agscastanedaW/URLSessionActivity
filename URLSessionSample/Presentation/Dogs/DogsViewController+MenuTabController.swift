//
//  DogsViewController+MenuTabController.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import UIKit

extension DogsViewController: MenuTabController {
    var item: MenuTabItem { .dogs }
    
    func setTabBarItem() {
        setTabBarItem(title: "Dogs",
                      unselected: UIImage(systemName: "heart") ?? UIImage(),
                      selected: UIImage(systemName: "heart.fill") ?? UIImage())
    }
}
