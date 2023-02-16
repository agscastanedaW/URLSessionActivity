//
//  MenuTabBarUIComposer.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import UIKit

final class MenuTabBarUIComposer {
    
    static func composed(with controllers: [MenuTabController]) -> UIViewController {
        let navigationControllers = controllers
            .map { MenuTabNavigationController(menuTabController: $0) }
        
        let menuTabBarViewModel = MenuTabBarViewModel(menuTabControllers: navigationControllers)
        return MenuTabBarController(viewModel: menuTabBarViewModel)
    }
}
