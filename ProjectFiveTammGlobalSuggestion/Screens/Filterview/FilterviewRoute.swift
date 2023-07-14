//
//  FilterviewRoute.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 14/06/23.
//

import UIKit

struct FilterviewRoute {
    var serviceEntities: [String]!
    func configureRouter(viewController: UIViewController, serviceEntities: [String]?) {
        let vc = FilterviewViewController()
        let presenter = FilterPresenter()
        vc.presenter = presenter
        presenter.viewController = vc
        var interactor = FilterInteractor()
        interactor.serviceEntities = serviceEntities
        presenter.interactor = interactor
        presenter.router = self
        if let sheetPresentContoller = vc.sheetPresentationController {
            sheetPresentContoller.detents = [.medium(),.large()]
            sheetPresentContoller.prefersGrabberVisible = true
        }
        viewController.present(vc, animated: true)
    }
}
