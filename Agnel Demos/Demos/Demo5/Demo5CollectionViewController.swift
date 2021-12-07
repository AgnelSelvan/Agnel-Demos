//
//  Demo5CollectionViewController.swift
//  Agnel Demos
//
//  Created by Neosoft on 06/12/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class Demo5CollectionViewController: UICollectionViewController {
    
    static func loadFromNib() -> Demo5CollectionViewController {
        return Demo5CollectionViewController(nibName: "Demo5CollectionViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(LabelCollectionViewCell.loadFromNib(), forCellWithReuseIdentifier: LabelCollectionViewCell.cellIdentifier)
        self.collectionView!.register(CategoryCVCell.loadFromNib(), forCellWithReuseIdentifier: CategoryCVCell.cellIdentifier)
        self.collectionView!.register(GoalsCVCell.loadFromNib(), forCellWithReuseIdentifier: GoalsCVCell.cellIdentifier)
        self.collectionView!.register(ModulesCVCell.loadFromNib(), forCellWithReuseIdentifier: ModulesCVCell.cellIdentifier)
        self.collectionView!.register(ModulesCell.loadFromNib(), forCellWithReuseIdentifier: ModulesCell.cellIdentifier)
        
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 5
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0, 2, 3:
            return 1
        case 1:
            return 1
        case 4:
            return Modules.getAllData.count
        default:
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.cellIdentifier, for: indexPath) as! LabelCollectionViewCell
            cell.titleLabel.text = "Continue Reading"
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVCell.cellIdentifier, for: indexPath) as! CategoryCVCell
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GoalsCVCell.cellIdentifier, for: indexPath) as! GoalsCVCell
            
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ModulesCVCell.cellIdentifier, for: indexPath) as! ModulesCVCell
            
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ModulesCell.cellIdentifier, for: indexPath) as! ModulesCell
            cell.updateModulesCell(module: Modules.getAllData[indexPath.row])
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContinueReadingCVCell.cellIdentifier, for: indexPath) as! ContinueReadingCVCell
            return cell
        }
        
    }
    
    private lazy var headerViewSupplementaryItem: NSCollectionLayoutBoundarySupplementaryItem = {
        let headerViewItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(44)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        headerViewItem.pinToVisibleBounds = true
        
        return headerViewItem
    }()
    
    
}


extension Demo5CollectionViewController: UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        switch indexPath.section {
        case 0:
            let cellWidth = UIScreen.main.bounds.size.width
            return CGSize(width: cellWidth, height: 60)
        case 1:
            
            let cellWidth = UIScreen.main.bounds.size.width
            return CGSize(width: cellWidth, height: 190)
        case 2:
            let cellWidth = UIScreen.main.bounds.size.width
            return CGSize(width: cellWidth, height: 150)
        case 3:
            let cellWidth = UIScreen.main.bounds.size.width
            return CGSize(width: cellWidth, height: 60)
        case 4:
            
            let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            let spacingBetweenCells: CGFloat = 10
            let numberOfItemsPerRow = CGFloat(2)
            
            let totalSpacing = (2 * sectionInsets.left) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
            
            
            if let collection = self.collectionView{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                let cellHeight = width + 40
                return CGSize(width: width, height: cellHeight)
            }
            let cellWidth = UIScreen.main.bounds.width * 0.4
            let cellHeight = cellWidth + 40
            return CGSize(width: cellWidth, height: cellHeight)
            
        default:
            let numberOfCell: CGFloat = 3
            let cellWidth = UIScreen.main.bounds.size.width / numberOfCell
            return CGSize(width: cellWidth, height: cellWidth)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 2:
            return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        case 3:
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        default:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

extension UIButton{
    func addBorder(_ borderColor: UIColor = .white) {
        self.layer.cornerRadius = 5
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1
    }
}
