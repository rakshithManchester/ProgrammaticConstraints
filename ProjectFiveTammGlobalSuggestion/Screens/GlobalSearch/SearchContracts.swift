//
//  Contracts.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import Foundation

protocol SearchInteractorContract {
    func getSearchResults(globalSearchRepositories: GlobalSearchRepositories)
}

protocol SearchPresenterContract: AnyObject {
   func onGetSearchResults(result: Result<GlobalSearchResults, Error>)
    func viewDataCreation(dtoModel: GlobalSearchResults)
}
