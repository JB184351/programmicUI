//
//  SwitchSettingsTableViewCell.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/12/20.
//

import UIKit

class SwitchSettingsTableViewCell: UITableViewCell {
  
  private var settingsLabel = UILabel()
  private var detailSettingsLabel = UILabel()
  private var settingsSwitch = UISwitch()
  private var mainSettingsStackView = UIStackView()
  private var detailStackView = UIStackView()
  
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
  // MARK: - Setup Methods
  //==================================================
  
  public func setup(with model: SettingsModel) {
    settingsLabel.text = model.setting
    detailSettingsLabel.text = model.settingDetails
  }
  
  private func setupUI() {
    self.contentView.backgroundColor = UIColor(red: 17/255, green: 22/255, blue: 38/255, alpha: 1)
    
    detailStackView.translatesAutoresizingMaskIntoConstraints = false
    
    mainSettingsStackView.axis = .horizontal
    mainSettingsStackView.alignment = .fill
    mainSettingsStackView.distribution = .equalCentering
    mainSettingsStackView.spacing = 0.0
    mainSettingsStackView.contentMode = .scaleToFill
    
    settingsLabel.textColor = .white
    settingsLabel.font = .systemFont(ofSize: 17.0)
    
    detailSettingsLabel.textColor = .white
    detailSettingsLabel.alpha = 0.5
    detailSettingsLabel.font = .systemFont(ofSize: 12.0)
    detailSettingsLabel.numberOfLines = 0
    
    settingsSwitch.onTintColor = UIColor(red: 194/255, green: 171/255, blue: 111/255, alpha: 1)
    settingsSwitch.tintColor = UIColor(red: 194/255, green: 171/255, blue: 111/255, alpha: 1)
    
    mainSettingsStackView.addArrangedSubview(settingsLabel)
    mainSettingsStackView.addArrangedSubview(settingsSwitch)
    
    self.contentView.addSubview(detailStackView)
    
    detailStackView.axis = .vertical
    detailStackView.alignment = .fill
    detailStackView.distribution = .fill
    detailStackView.spacing = 0.0
    detailStackView.contentMode = .scaleToFill
    
    detailStackView.addArrangedSubview(mainSettingsStackView)
    detailStackView.addArrangedSubview(detailSettingsLabel)
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    detailStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
    detailStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
    detailStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    detailStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
  }
  
}
