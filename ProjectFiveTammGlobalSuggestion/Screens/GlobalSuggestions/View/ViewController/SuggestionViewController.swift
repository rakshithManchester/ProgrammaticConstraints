//
//  SuggestionViewController.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import UIKit

class SuggestionViewController: UIViewController {
    private var cellHeight = 50.0
    
    var tableView: UITableView! {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor,constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        return tableView
    }
    var searchBar: UISearchBar! {
        let searchBar = UISearchBar()
        view.addSubview(searchBar)
        searchBar.backgroundColor = .gray
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return searchBar
    }
    var suggestionPresenter: SuggestionPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: SuggestionTableViewCell.id, bundle: nil), forCellReuseIdentifier: SuggestionTableViewCell.id)
    }
    func reloadUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension SuggestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let suggestTxt = suggestionPresenter.suggestionViewData {
            suggestionPresenter.didSelect(selectedSuggestion: suggestTxt[indexPath.row])
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellHeight
    }
}

extension SuggestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let suggestionViewDataCount = suggestionPresenter.suggestionViewData?.count else {
            return 0
        }
        return suggestionViewDataCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SuggestionTableViewCell.id, for: indexPath) as? SuggestionTableViewCell else { return UITableViewCell() }
        if let suggestTxt = suggestionPresenter.suggestionViewData {
            cell.setupCell(suggestionText:  suggestTxt[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let suggestionViewDataCount = suggestionPresenter.suggestionViewData?.count else {
            return UIView()
        }
        return customTableviewHeader()
    }
    func customTableviewHeader() -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .white
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width - 20, height: 40))
        headerLabel.attributedText = NSAttributedString(string: "Are you looking for")
        headerView.addSubview(headerLabel)
        return headerView
    }
}

extension SuggestionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let suggestText = searchBar.text {
            suggestionPresenter.onGetSuggestionResults(suggestText: suggestText)
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            //TODO: remove HeaderView
            tableView.tableHeaderView?.removeFromSuperview()
            tableView.tableHeaderView = UIView()
            suggestionPresenter.suggestionViewData = []
        }
    }
}
