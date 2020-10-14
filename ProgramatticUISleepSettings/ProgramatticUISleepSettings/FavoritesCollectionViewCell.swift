//
//  FavoritesCollectionViewCell.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/12/20.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    var favoritesLabel = UILabel()
    
    func setup(with model: SettingsFavoritesModel) {
        favoritesLabel.text = model.title
    }
}
