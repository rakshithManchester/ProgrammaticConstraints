//
//  FilterPresenter.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 14/06/23.
//

import Foundation

class FilterPresenter {
    weak var viewController: FilterviewViewController!
    var interactor: FilterInteractor!
    var router: FilterviewRoute!
    
    func fetchfetchPersonaCount() -> Int {
        let data = interactor.fetchPersonaData()
        return data.count
    }
    func fetchPersonaData() -> [String] {
       return interactor.fetchPersonaData()
    }
    func fetchEntitiesCount() -> Int {
        return interactor.fetchEntities().count
    }
    func fetchEntitiesData() -> [String] {
        return interactor.fetchEntities()
    }
}
