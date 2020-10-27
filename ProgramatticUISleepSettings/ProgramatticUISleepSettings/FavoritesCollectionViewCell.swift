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
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor(red: 17/255, green: 22/255, blue: 38/255, alpha: 1)
        
        configureFavoritesLabel()
        self.addSubview(favoritesLabel)
        configureFavoritesLabelConstraints()
    }
    
    public func setup(with model: SettingsFavoritesModel) {
        favoritesLabel.text = model.title
    }
    
    private func configureFavoritesLabel() {
        favoritesLabel.textColor = .white
        favoritesLabel.font = .systemFont(ofSize: 17.0)
        favoritesLabel.textAlignment = .center
    }
    
    private func configureFavoritesLabelConstraints() {
        favoritesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        favoritesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        favoritesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        favoritesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        favoritesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
}
