//
//  Contracts.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import UIKit

protocol SuggestionsInteractorContract {
    func onGetSuggestionResults(suggestText: String, searchRepositories: GlobalSearchRepositories, completionHandler: @escaping (Result<GlobalSearchSuggestions, Error>) -> ())
}

protocol SuggestionPresenterContract: AnyObject {
    func onGetSuggestionResults(suggestText: String)
    func viewDataCreation(dtoModel: GlobalSearchSuggestions)
    func didSelect(selectedSuggestion: String)
}

protocol RouterProtocol {
    mutating func configure(navigation: UINavigationController) -> UIViewController
    func pushViewController()
}
