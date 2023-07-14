//
//  SuggestionTableViewCell.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 25/05/23.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    var suggestionTxtLbl = UILabel()
    
    static let id = "SuggestionTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSuggestionTxtConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSuggestionTxtConstraints() {
        addSubview(suggestionTxtLbl)
        suggestionTxtLbl.translatesAutoresizingMaskIntoConstraints = false
        suggestionTxtLbl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        suggestionTxtLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10).isActive = true
        suggestionTxtLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10).isActive = true
        suggestionTxtLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupCell(suggestionText: String) {
        suggestionTxtLbl.text = suggestionText
    }
    
}
