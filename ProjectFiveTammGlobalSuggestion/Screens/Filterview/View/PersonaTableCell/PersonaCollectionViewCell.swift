//
//  PersonaCollectionViewCell.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 14/06/23.
//

import UIKit

class PersonaCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    static let id = "PersonaCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configureTitle(title: String) {
        titleLabel.text = title
    }
    func addCellBorder(borderWidth: Int, color: CGColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
}
