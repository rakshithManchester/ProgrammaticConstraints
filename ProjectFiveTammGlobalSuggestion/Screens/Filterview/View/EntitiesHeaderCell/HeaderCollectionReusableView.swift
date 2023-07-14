//
//  HeaderCollectionReusableView.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 18/06/23.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var govtEntitiesLabel: UILabel!
    @IBOutlet weak var clearLabel: UILabel!
    static let id = "HeaderCollectionReusableView"
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    private let govtEntityLabel: UILabel = {
        let label = UILabel()
        label.text = "GOVERNMENT ENTITIES"
        return label
    }()
    private let clearEntityLabel: UILabel = {
        let label = UILabel()
        label.text = "Clear"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(govtEntityLabel)
        addSubview(clearEntityLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    func configureUI() {
        govtEntityLabel.translatesAutoresizingMaskIntoConstraints = false
        govtEntityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        govtEntityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        govtEntityLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        govtEntityLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        clearEntityLabel.translatesAutoresizingMaskIntoConstraints = false
        clearEntityLabel.centerYAnchor.constraint(equalTo: self.govtEntityLabel.centerYAnchor).isActive = true
        clearEntityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        clearEntityLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        clearEntityLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
