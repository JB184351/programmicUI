//
//  FavoritesCollectionViewCell.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/12/20.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    var favoritesLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with model: SettingsFavoritesModel) {
        favoritesLabel.text = model.title
    }
}
