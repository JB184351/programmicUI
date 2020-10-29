//
//  SleepSettingsTableViewCell.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/12/20.
//

import UIKit

class SleepSettingsTableViewCell: UITableViewCell {
  
  private var settingsLabel = UILabel()
  private var detailSettingsLabel = UILabel()
  private var statusLabel = UILabel()
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
  // MARK: - Setup
  //==================================================
  
  public func setup(with model: SettingsModel) {
    settingsLabel.text = model.setting
    detailSettingsLabel.text = model.settingDetails
    statusLabel.text = model.settingStatus! + " >"
  }
  
  private func setupUI() {
    contentView.backgroundColor = UIColor(red: 17/255, green: 22/255, blue: 38/255, alpha: 1)
    
    detailStackView.translatesAutoresizingMaskIntoConstraints = false
    
    contentView.addSubview(detailStackView)
    
    // Configuring Main Stack View Here
    mainSettingsStackView.axis = .horizontal
    mainSettingsStackView.alignment = .fill
    mainSettingsStackView.distribution = .equalCentering
    mainSettingsStackView.spacing = 0.0
    mainSettingsStackView.contentMode = .scaleToFill
    
    mainSettingsStackView.addArrangedSubview(settingsLabel)
    mainSettingsStackView.addArrangedSubview(statusLabel)
    
    settingsLabel.textColor = .white
    settingsLabel.font = .systemFont(ofSize: 17.0)
    
    statusLabel.textColor = UIColor(red: 194/255, green: 171/255, blue: 111/255, alpha: 1)
    statusLabel.font = .systemFont(ofSize: 16.0)
    
    // Configuring Detail Stack View Here
    detailStackView.addArrangedSubview(mainSettingsStackView)
    
    detailStackView.axis = .vertical
    detailStackView.alignment = .fill
    detailStackView.distribution = .fill
    detailStackView.spacing = 0.0
    detailStackView.contentMode = .scaleToFill
    
    detailSettingsLabel.textColor = .white
    detailSettingsLabel.alpha = 0.5
    detailSettingsLabel.font = .systemFont(ofSize: 12)
    
    detailStackView.addArrangedSubview(detailSettingsLabel)
    setupConstraints()
  }
  
  private func setupConstraints() {
    detailStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
    detailStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    detailStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
    detailStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
  }
  
}
