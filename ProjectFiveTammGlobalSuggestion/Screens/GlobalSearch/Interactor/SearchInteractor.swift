//
//  GlobalSearchResultsInteractor.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import Foundation

struct SearchInteractor: SearchInteractorContract {
    weak var presenter: SearchPresenter?
    var selectedSuggestion: String
    
    func getSearchResults(globalSearchRepositories: GlobalSearchRepositories) {
        globalSearchRepositories.getSearchResult(searchText: selectedSuggestion) { (result: Result<GlobalSearchResults, Error>) in
            presenter?.onGetSearchResults(result: result)
        }
    }
}
