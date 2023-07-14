//
//  GovtEntitiesCollectionViewCell.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 14/06/23.
//

import UIKit

class GovtEntitiesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var entitiesLbl: UILabel!
    @IBOutlet weak var entitiesBtn: UIButton!
    @IBAction func entitiesBtn(sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            entitiesBtn.setImage(UIImage(named: "unchecked"), for: .normal)
            entitiesBtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        } else {
            sender.isSelected = true
            entitiesBtn.setImage(UIImage(systemName: "checkmark.rectangle.fill"), for: .selected)
        }
    }
    static let id = "GovtEntitiesCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        configureButton()
    }
    func configureButton() {
        entitiesBtn.setImage(UIImage(systemName: "checkmark.rectangle.fill"), for: .selected)
        entitiesBtn.setImage(UIImage(systemName: ""), for: .normal)
    }
    func configureUI(entityName: String) {
        entitiesLbl.text = entityName
    }
    func addCellBorder(borderWidth: Int, color: CGColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
//    func calculateSize(text: String) -> CGSize {
//        let font =  UIFont(name: "Helvetica", size: 45)
//        let size = text.size(withAttributes:[.font: font])
//        let rightSize = CGSize(width: size.width, height: 40)
//        return rightSize
//    }
}
