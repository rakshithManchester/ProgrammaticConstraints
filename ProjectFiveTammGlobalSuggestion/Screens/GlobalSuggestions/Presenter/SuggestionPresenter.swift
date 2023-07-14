//
//  SuggestionPresenter.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import Foundation

class SuggestionPresenter: SuggestionPresenterContract {
    var interactor: SuggestionInteractor!
    var router: SuggestionRouter!
    var suggestionViewData: GlobalSearchSuggestions? {
        didSet {
            view.reloadUI()
        }
    }
    weak var view: SuggestionViewController!
    
    func onGetSuggestionResults(suggestText: String) {
        interactor.onGetSuggestionResults(suggestText: suggestText,searchRepositories: GlobalSearchRepositories()) { (result: Result<GlobalSearchSuggestions, Error>) in
            switch result {
            case .success(let dtoModel):
                self.viewDataCreation(dtoModel: dtoModel)
            case .failure(let error):
                print(error)
            }
        }
    }
    func viewDataCreation(dtoModel: GlobalSearchSuggestions) {
        suggestionViewData = dtoModel
    }
    func didSelect(selectedSuggestion: String) {
        guard let navigationCOntroller = view.navigationController else { return }
        router.selectedSuggestion = selectedSuggestion
        router.pushViewController()
    }
}
