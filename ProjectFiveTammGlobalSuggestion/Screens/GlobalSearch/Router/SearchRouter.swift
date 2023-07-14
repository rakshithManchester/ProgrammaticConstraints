//
//  SearchRouter.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 26/05/23.
//

import UIKit

struct SearchRouter {
    var selectedSuggestion: String!
    var serviceEntities: [String]!
    func configure(navigation: UINavigationController) -> UIViewController {
        let view = SearchViewController()
        let presenter = SearchPresenter()
        view.searchPresenter = presenter
        var interactor = SearchInteractor(selectedSuggestion: selectedSuggestion)
        interactor.presenter = presenter
        interactor.getSearchResults(globalSearchRepositories: GlobalSearchRepositories())
        presenter.interactor = interactor
        presenter.view = view
        presenter.searchRouter = self
        navigation.pushViewController(view, animated: true)
        return navigation
    }
    func pushViewController(viewController: UIViewController)  {
        var filterRouter = FilterviewRoute()
        filterRouter.serviceEntities = serviceEntities
        filterRouter.configureRouter(viewController: viewController, serviceEntities: serviceEntities)
    }
}
