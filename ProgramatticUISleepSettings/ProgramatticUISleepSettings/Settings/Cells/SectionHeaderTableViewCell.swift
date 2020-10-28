//
//  SectionHeaderTableViewCell.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/24/20.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {
  
  //==================================================
  // MARK: - Private Properties
  //==================================================
  
  private var sectionHeaderStackView = UIStackView()
  private var leftView = UIView()
  private var rightView = UIView()
  
  //==================================================
  // MARK: - Public Properties
  //==================================================
  
  public var sectionHeaderLabel = UILabel()
  
  //==================================================
  // MARK: - Init Methods
  //==================================================
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //==================================================
  // MARK: - Setup UI
  //==================================================
  
  private func setupUI() {
    sectionHeaderStackView.translatesAutoresizingMaskIntoConstraints = false
    leftView.translatesAutoresizingMaskIntoConstraints = false
    rightView.translatesAutoresizingMaskIntoConstraints = false
    
    self.contentView.addSubview(sectionHeaderStackView)
    
    sectionHeaderStackView.axis = .horizontal
    sectionHeaderStackView.alignment = .center
    sectionHeaderStackView.distribution = .fill
    sectionHeaderStackView.spacing = 20.0
    sectionHeaderStackView.contentMode = .scaleToFill
    
    setupConstraintsForSectionHeaderStackView()
    
    leftView.backgroundColor = .lightGray
    
    sectionHeaderLabel.textColor = UIColor(red: 194/255, green: 171/255, blue: 111/255, alpha: 1)
    sectionHeaderLabel.font = .systemFont(ofSize: 18)
    sectionHeaderLabel.textAlignment = .center
    sectionHeaderLabel.numberOfLines = 1
    
    rightView.backgroundColor = .lightGray
    
    sectionHeaderStackView.addArrangedSubview(leftView)
    sectionHeaderStackView.addArrangedSubview(sectionHeaderLabel)
    sectionHeaderStackView.addArrangedSubview(rightView)
    
    setupConstraintsForViews()
  }
  
  //==================================================
  // MARK: - Setting Constraints
  //==================================================
  
  private func setupConstraintsForViews() {
    leftView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    leftView.widthAnchor.constraint(equalTo: rightView.widthAnchor).isActive = true
    
    rightView.widthAnchor.constraint(equalTo: leftView.widthAnchor).isActive = true
    rightView.heightAnchor.constraint(equalTo: leftView.heightAnchor).isActive = true
  }
  
  private func setupConstraintsForSectionHeaderStackView() {
    sectionHeaderStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    sectionHeaderStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    sectionHeaderStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    sectionHeaderStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
  }
  
}
