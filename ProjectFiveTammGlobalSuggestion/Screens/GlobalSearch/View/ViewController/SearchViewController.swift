//
//  SearchViewController.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var cellHeight = 110.0
    private var cellHeaderHeight = 80.0
    var searchPresenter: SearchPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: SearchTableViewCell.Id, bundle: nil), forCellReuseIdentifier: SearchTableViewCell.Id)
    }
    func reloadUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellHeaderHeight
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchPresenter.searchViewDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.Id, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        let searchData = searchPresenter.searchViewDataArray[indexPath.row]
        cell.updateUI(searchView: searchData)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if searchPresenter.searchViewDataArray.count != 0 {
            return customTableviewHeader()
        } else {
            return UIView()
        }
    }
    func customTableviewHeader() -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width , height: 80))
        let headerLabel = UILabel()
        let button = UIButton()
        headerView.addSubview(headerLabel)
        headerView.addSubview(button)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 0).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true
        button.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(openFilter), for: .touchUpInside)
        button.setImage(UIImage(systemName: "search"), for: .normal)
        button.backgroundColor = .orange
        headerLabel.attributedText = NSAttributedString(string: "Search Result for - request to Driving Licence test ")
        headerLabel.numberOfLines = 0
        headerLabel.adjustsFontSizeToFitWidth = true
        headerView.backgroundColor = .systemGray6
        
        return headerView
    }
    @objc func openFilter() {
        searchPresenter.searchRouter.pushViewController(viewController: self)
    }
}
