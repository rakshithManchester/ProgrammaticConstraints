//
//  SearchPresenter.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import Foundation

class SearchPresenter: SearchPresenterContract {
    var interactor: SearchInteractor!
    var searchRouter = SearchRouter()
    weak var view: SearchViewController!
    var searchViewDataArray: [SearchViewData] = [] {
        didSet {
            createServiceEntities(searchViewDataArray: searchViewDataArray)
            view.reloadUI()
        }
    }
    func onGetSearchResults(result: Result<GlobalSearchResults, Error>) {
            switch result {
            case .success(let dtoModel):
                viewDataCreation(dtoModel: dtoModel)
            case .failure(let error):
                print(error)
            }
    }
    func viewDataCreation(dtoModel: GlobalSearchResults) {
        var searchArray = [SearchViewData]()
        dtoModel.results?.forEach({ result in
            guard let itemDetails = result.itemDetails, let title = itemDetails.title, let description = itemDetails.description, let entity = itemDetails.entity, let entityName = entity.name  else {return}
            let searchViewData = SearchViewData(serviceName: title, serviceDescrpition: description, serviceEntities: entityName)
            searchArray.append(searchViewData)
        })
        searchViewDataArray = searchArray
    }
    func createServiceEntities(searchViewDataArray: [SearchViewData]) {
        let serviceEntity = searchViewDataArray.map { data in
            data.serviceEntities
        }
        searchRouter.serviceEntities = serviceEntity
    }
}
