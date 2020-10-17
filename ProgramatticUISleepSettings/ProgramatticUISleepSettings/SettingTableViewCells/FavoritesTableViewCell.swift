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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(self.collectionView)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
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
        let favorite = favoritesDataSource[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoritesCell", for: indexPath) as! FavoritesCollectionViewCell
        cell.setup(with: favorite)
        return cell
    }
    
    
}

extension FavoritesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let favorite = favoritesDataSource[indexPath.row]
        let selectedFavorite = favorite.action
        selectedFavorite()
    }
}

extension FavoritesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let favorite = favoritesDataSource[indexPath.row].title!
        let size = favorite.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: .regular)])
        return CGSize(width: size.width, height: 50.0)
    }
}
