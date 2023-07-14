//
//  SuggestionInteractor.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import Foundation

struct SuggestionInteractor: SuggestionsInteractorContract{
    weak var presenter: SuggestionPresenter!
    func onGetSuggestionResults(suggestText: String, searchRepositories: GlobalSearchRepositories, completionHandler: @escaping (Result<GlobalSearchSuggestions, Error>) -> ()) {
        searchRepositories.getSearchSuggestions(suggestText: suggestText) { (result: Result<GlobalSearchSuggestions, Error>) in
            completionHandler(result)
        }
    }
}
