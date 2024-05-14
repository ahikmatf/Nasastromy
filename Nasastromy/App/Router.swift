//
//  Router.swift
//  Nasastromy
//
//  Created by Asep Hikmat Fatahillah on 13/05/24.
//

import UIKit

protocol Routable {
    func showRootViewController() -> UIViewController
    func showGenericErrorAlert()
    func showDetailViewController(data: AstroPod)
}

final class Router: Routable {
    private let navigationController: UINavigationController
    private let mainDispatchQueue: DispatchQueueType
    
    init(navigationController: UINavigationController, mainDispatchQueue: DispatchQueueType = DispatchQueue.main) {
        self.navigationController = navigationController
        self.mainDispatchQueue = mainDispatchQueue
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
    
    func showGenericErrorAlert() {
        mainDispatchQueue.async {
            let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.navigationController.present(alert, animated: true)
        }
    }
    
    func showDetailViewController(data: AstroPod) {
        let presenter = DetailPresenter(detailData: data)
        let viewController = DetailViewController(presenter: presenter)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
