//
//  RouterMock.swift
//  NasastromyTests
//
//  Created by Asep Hikmat Fatahillah on 14/05/24.
//

@testable import Nasastromy
import UIKit

final class RouterMock: Routable {
    var showRootViewControllerInvoked = false
    func showRootViewController() -> UIViewController {
        showRootViewControllerInvoked = true
        return UIViewController()
    }
    
    var showGenericErrorAlertInvoked = false
    func showGenericErrorAlert() {
        showGenericErrorAlertInvoked = true
    }
    
    var showDetailViewControllerInvoked = false
    var showDetailViewControllerData: AstroPod?
    func showDetailViewController(data: AstroPod) {
        showDetailViewControllerInvoked = true
        showDetailViewControllerData = data
    }
}
