//
//  FilterviewViewController.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 14/06/23.
//

import UIKit

class FilterviewViewController: UIViewController {
    @IBOutlet weak var filetrCollectionView: UICollectionView!
    @IBAction func clearAllBtn(sender: UIButton) {
        
    }
    @IBAction func applyFilterBtn(sender: UIButton) {
        
    }
    @IBAction func cancelBtn(sender: UIButton) {
        
    }
    var presenter: FilterPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    func registerCells() {
        filetrCollectionView.dataSource = self
        filetrCollectionView.delegate = self
        filetrCollectionView.register(UINib(nibName: PersonaCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: PersonaCollectionViewCell.id)
        filetrCollectionView.register(UINib(nibName: GovtEntitiesCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: GovtEntitiesCollectionViewCell.id)
        //        filetrCollectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.id)
        filetrCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.id)
    }
}

extension FilterviewViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return presenter.fetchfetchPersonaCount()
        }
        return presenter.fetchEntitiesCount()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let personaEntitiesCell = filetrCollectionView.dequeueReusableCell(withReuseIdentifier: PersonaCollectionViewCell.id, for: indexPath) as? PersonaCollectionViewCell else {
                return UICollectionViewCell()
            }
            let data = presenter.fetchPersonaData()
            personaEntitiesCell.configureTitle(title: data[indexPath.row])
            personaEntitiesCell.addCellBorder(borderWidth: 1, color: UIColor.black.cgColor)
            return personaEntitiesCell
        }
        guard let govtEntitiesCell = filetrCollectionView.dequeueReusableCell(withReuseIdentifier: GovtEntitiesCollectionViewCell.id, for: indexPath) as? GovtEntitiesCollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = presenter.fetchEntitiesData()
        govtEntitiesCell.configureUI(entityName: data[indexPath.row])
        govtEntitiesCell.addCellBorder(borderWidth: 1, color: UIColor.black.cgColor)
        return govtEntitiesCell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.id, for: indexPath)
            return reusableview
        default:  fatalError("Unexpected element kind")
        }
    }
    //TODO: how to create a generic?
    //    func dequeueReusableCell<T>(cell: T, indexpat: IndexPath) -> T where T:UICollectionReusableView {
    //        guard let cell = filetrCollectionView.dequeueReusableCell(withReuseIdentifier: "\(cell)", for: indexpat) as? T else {
    //            return cell
    //        }
    //        return UICollectionViewCell()
    //    }
}

extension FilterviewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let data = presenter.fetchPersonaData()
            let size = calculate(text: data[indexPath.row], indexPath: indexPath)
            return size
        }
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    func calculate(text: String, indexPath: IndexPath) -> CGSize {
        let labelForSizeCalculation = UILabel(frame: CGRect.zero)
        labelForSizeCalculation.text = text
        labelForSizeCalculation.sizeToFit()
        return CGSize(width: labelForSizeCalculation.frame.width, height: 32)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}
