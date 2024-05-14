//
//  NavigationControllerMock.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

import UIKit

final class NavigationControllerMock: UINavigationController {
    var setViewControllersInvoked = false
    var setViewControllersVC = [UIViewController]()
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        setViewControllersInvoked = true
        setViewControllersVC = viewControllers
    }
    
    var presentInvoked = false
    var presentedVC: UIViewController?
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentInvoked = true
        presentedVC = viewControllerToPresent
    }
    
    var pushViewControllerInvoked = false
    var pushViewControllerVC: UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerInvoked = true
        pushViewControllerVC = viewController
    }
}
