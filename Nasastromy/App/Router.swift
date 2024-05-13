//
//  Router.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 13/05/24.
//

import UIKit

protocol Routable {
    func showRootViewController() -> UIViewController
}

final class Router: Routable {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showRootViewController() -> UIViewController {
        let feedService = FeedService(urlSession: URLSession.shared)
        let presenter = FeedPresenter(router: self, feedService: feedService)
        let viewController = FeedViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        
        navigationController.setViewControllers([viewController], animated: false)
        return navigationController
    }
}
