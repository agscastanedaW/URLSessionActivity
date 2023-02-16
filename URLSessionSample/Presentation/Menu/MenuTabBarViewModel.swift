//
//  MenuTabBarViewModel.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

final class MenuTabBarViewModel {

    let menuTabControllers: [MenuTabController]
    
    init(menuTabControllers: [MenuTabController]) {
        self.menuTabControllers = menuTabControllers
            .sorted(by: { $0.item.rawValue < $1.item.rawValue })
        self.setTabItems(of: menuTabControllers)
    }
    
    private func setTabItems(of menuTabControllers: [MenuTabController]) {
        menuTabControllers.forEach({ $0.setTabBarItem() })
    }
}
