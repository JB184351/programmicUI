//
//  FavoritesTableViewCell.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/12/20.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    lazy var collectionView = UICollectionView()
    var favoritesDataSource = [SettingsFavoritesModel]()

    override class func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func setup(with model: [SettingsFavoritesModel]) {
        self.favoritesDataSource = model
        self.collectionView.reloadData()
    }
    
}

extension FavoritesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoritesDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

extension FavoritesTableViewCell: UICollectionViewDelegate {
    
}

extension FavoritesTableViewCell: UICollectionViewDelegateFlowLayout {
    
}
