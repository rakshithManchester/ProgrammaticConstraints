//
//  FilterInteractor.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 14/06/23.
//

import Foundation

struct FilterInteractor {
    var serviceEntities: [String]!
    func fetchPersonaData() -> [String] {
        let values: [String] = PersonaConstants.allCases.map({$0.rawValue})
        return values
    }
    func fetchEntities() -> [String] {
        return serviceEntities
    }
}
