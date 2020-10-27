//
//  SectionHeaderTableViewCell.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/24/20.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {
    
    var sectionHeaderLabel = UILabel()
    var sectionHeaderStackView = UIStackView()
    var leftView = UIView()
    var rightView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        sectionHeaderStackView.translatesAutoresizingMaskIntoConstraints = false
        leftView.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(sectionHeaderStackView)
        
        configureStackView()
        configureStackViewConstraints()
        configureUIElements()
    }
    
    func configureUIElements() {

        leftView.backgroundColor = .lightGray
        rightView.backgroundColor = .lightGray
        
        sectionHeaderLabel.textColor = UIColor(red: 194/255, green: 171/255, blue: 111/255, alpha: 1)
        sectionHeaderLabel.font = .systemFont(ofSize: 18)
        sectionHeaderLabel.textAlignment = .center
        sectionHeaderLabel.numberOfLines = 1
        
        sectionHeaderStackView.addArrangedSubview(leftView)
        sectionHeaderStackView.addArrangedSubview(sectionHeaderLabel)
        sectionHeaderStackView.addArrangedSubview(rightView)
        
        configureUIElementConstraints()
    }
    
    func configureStackView() {
        
        sectionHeaderStackView.axis = .horizontal
        sectionHeaderStackView.alignment = .center
        sectionHeaderStackView.distribution = .fill
        sectionHeaderStackView.spacing = 20.0
        sectionHeaderStackView.contentMode = .scaleToFill
    }
    
    func configureUIElementConstraints() {
        
        leftView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        leftView.widthAnchor.constraint(equalTo: rightView.widthAnchor).isActive = true
        
        rightView.widthAnchor.constraint(equalTo: leftView.widthAnchor).isActive = true
        rightView.heightAnchor.constraint(equalTo: leftView.heightAnchor).isActive = true
    }
    
    func configureStackViewConstraints() {
        
        sectionHeaderStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        sectionHeaderStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        sectionHeaderStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        sectionHeaderStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    }
}
