//
//  SearchTableViewCell.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var serviceDescription: UILabel!
    @IBOutlet weak var serviceEntity: UILabel!
    static let Id = "SearchTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateUI(searchView: SearchViewData) {
        serviceLabel.text = searchView.serviceName
        serviceDescription.text = searchView.serviceDescrpition
        serviceEntity.text = searchView.serviceEntities
    }
}
