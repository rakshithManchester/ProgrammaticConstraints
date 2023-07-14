//
//  GlobalSearchRepositories.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 24/05/23.
//

import Foundation

protocol GlobalSearchProtocol {
    func getSearchSuggestions(suggestText: String, completionHandler: @escaping (Result<GlobalSearchSuggestions, Error>) -> ())
    func getSearchResult(searchText: String, completionHandler: @escaping (Result<GlobalSearchResults, Error>) -> ())
}

class GlobalSearchRepositories: GlobalSearchProtocol {
    var networkManager = NetworkManager()
    func getSearchSuggestions(suggestText: String, completionHandler: @escaping (Result<GlobalSearchSuggestions, Error>) -> ()) {
        networkManager.fetchApiData(endPoint: .getSuggestion(suggestText: suggestText)) { (result: Result<GlobalSearchSuggestions, Error>) in
            completionHandler(result)
        }
    }
    
    func getSearchResult(searchText: String, completionHandler: @escaping (Result<GlobalSearchResults, Error>) -> ()) {
        networkManager.fetchApiData(endPoint: .searchResults(searchText: searchText)) { (result: Result<GlobalSearchResults, Error>) in
            completionHandler(result)
        }
    }
}
