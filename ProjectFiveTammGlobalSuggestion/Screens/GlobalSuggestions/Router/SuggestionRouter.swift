//
//  SuggestionRouter.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 26/05/23.
//

import UIKit

struct SuggestionRouter: RouterProtocol {
    var selectedSuggestion: String!
    var navigationController: UINavigationController!
    mutating func configure(navigation: UINavigationController) -> UIViewController {
        self.navigationController = navigation
        let view = SuggestionViewController()
        let presenter = SuggestionPresenter()
        view.suggestionPresenter = presenter
        let interactor = SuggestionInteractor()
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = self
        navigation.pushViewController(view, animated: true)
        return navigation
    }
    
    func pushViewController() {
        var router = SearchRouter()
        router.selectedSuggestion = selectedSuggestion
        router.configure(navigation: navigationController)
    }
}
