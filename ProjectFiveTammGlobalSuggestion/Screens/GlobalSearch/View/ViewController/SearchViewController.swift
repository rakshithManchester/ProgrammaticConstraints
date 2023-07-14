//
//  SearchViewController.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet var searchView: SearchView!
    var searchPresenter: SearchPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView = SearchView(frame: )
        searchView.searchPresenter = searchPresenter
    }
    
    func reloadUI() {
        searchView.reloadUI()
    }
}

