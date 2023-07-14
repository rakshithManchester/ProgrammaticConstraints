//
//  SuggestionTableViewCell.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    var suggestionTxtLbl: UILabel! {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        return label
    }
    static let id = "SuggestionTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(suggestionText: String) {
        suggestionTxtLbl.text = suggestionText
    }
}
