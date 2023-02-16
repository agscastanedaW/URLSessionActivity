//
//  MenuTabController.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import UIKit

protocol MenuTabController: UIViewController {
    var item: MenuTabItem { get }
    func setTabBarItem()
}

extension MenuTabController {
    func setTabBarItem(title: String, unselected image: UIImage, selected selectedImage: UIImage) {
        tabBarItem.title = title
        tabBarItem.image = image
        tabBarItem.selectedImage = selectedImage
    }
}

enum MenuTabItem: Int {
    case cats = 0
    case dogs = 1
}
