//
//  FavoritesTableViewCell.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/12/20.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    // TODO: Add access indicators (public/private)
    // Group private/public methods and add // MARK: indicators
    // Fix indentation
    var collectionView: UICollectionView!
    var favoritesDataSource = [SettingsFavoritesModel]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        configureCollectionView()
        contentView.addSubview(collectionView)
        setCollectionViewConstraints()
    }
    
    public func setup(with model: [SettingsFavoritesModel]) {
        self.favoritesDataSource = model
        self.collectionView.reloadData()
    }
    
    // Move to setupUI
    private func configureCollectionView() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        let frame = CGRect(x: 0.0, y: 0.0, width: contentView.frame.width, height: contentView.frame.height)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: 100, height: 100)
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        self.collectionView = UICollectionView(frame: frame, collectionViewLayout: collectionViewFlowLayout)
        self.collectionView.backgroundColor = UIColor(red: 17/255, green: 22/255, blue: 38/255, alpha: 1)
        
        collectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: "favoritesCell")
    }
    
    // Rename method
    private func setCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
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
