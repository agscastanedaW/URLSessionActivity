//
//  MainTabNavigationController.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import UIKit

final class MenuTabNavigationController: UINavigationController, MenuTabController {
    
    private let menuTabController: MenuTabController
    
    var item: MenuTabItem {
        menuTabController.item
    }

    init(menuTabController: MenuTabController) {
        self.menuTabController = menuTabController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTabBarItem() {
        self.viewControllers = [menuTabController]
        menuTabController.setTabBarItem()
    }
}
