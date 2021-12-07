//
//  CategoryCVCell.swift
//  Agnel Demos
//
//  Created by Neosoft on 07/12/21.
//

import UIKit

class CategoryCVCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    static var cellIdentifier = "categoryCVCell"
    
    static func loadFromNib() -> UINib {
        return UINib(nibName: "CategoryCVCell", bundle: nil)
    }

    @IBOutlet weak var appCollectionView: UICollectionView!
    @IBOutlet weak var categoryPageControl: UIPageControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        appCollectionView.dataSource = self
        appCollectionView.delegate = self
        appCollectionView.register(ContinueReadingCVCell.loadFromNib(), forCellWithReuseIdentifier: ContinueReadingCVCell.cellIdentifier)
        categoryPageControl.currentPage = 0
        categoryPageControl.numberOfPages = 4
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: ContinueReadingCVCell.cellIdentifier, for: indexPath) as! ContinueReadingCVCell
        
        cell.backgroundColor = .orange.withAlphaComponent(0.2)
        cell.layer.cornerRadius = 10
        cell.updateContinueReadingCell(module: Modules.getAllData[indexPath.row])
        return cell

    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.95 , height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        categoryPageControl.currentPage = indexPath.row
    }

}
