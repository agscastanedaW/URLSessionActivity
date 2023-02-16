//
//  MenuTabBarController.swift
//  URLSessionSample
//
//  Created by Victor Pacheco on 16/02/23.
//

import UIKit

final class MenuTabBarController: UITabBarController {
    
    private let viewModel: MenuTabBarViewModel
    
    init(viewModel: MenuTabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabControllers()
    }
    
    private func setTabControllers() {
        viewControllers = viewModel.menuTabControllers
    }
}

