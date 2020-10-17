//
//  SleepSettingsTableViewCell.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/12/20.
//

import UIKit

class SleepSettingsTableViewCell: UITableViewCell {

    var settingsLabel = UILabel()
    var detailSettingsLabel = UILabel()
    var statusLabel = UILabel()
    var mainStackView = UIStackView()
    var detailStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with model: SettingsModel) {
        settingsLabel.text = model.setting
        detailSettingsLabel.text = model.settingDetails
        statusLabel.text = model.settingStatus! + " >"
    }
    
    func setupUI() {
        self.contentView.backgroundColor = .systemBlue
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        
        configureSettingsLabel()
        configureDetailSettingsLabel()
        configureStatusLabel()
        configureMainSettingStackView()
        configureDetailSettingStackView()
    }
    
    func configureSettingsLabel() {
        settingsLabel.textColor = .black
        settingsLabel.font = .systemFont(ofSize: 17.0)
    }
    
    func configureDetailSettingsLabel() {
        detailSettingsLabel.textColor = .white
        detailSettingsLabel.alpha = 0.5
        detailSettingsLabel.font = .systemFont(ofSize: 12.0)
        detailSettingsLabel.numberOfLines = 0
    }
    
    func configureStatusLabel() {
        statusLabel.textColor = .black
        statusLabel.font = .systemFont(ofSize: 17.0)
    }
    
    func configureMainSettingStackView() {
        self.addSubview(mainStackView)
        
        mainStackView.axis = .horizontal
        mainStackView.alignment = .fill
        mainStackView.distribution = .equalCentering
        mainStackView.spacing = 0.0
        mainStackView.contentMode = .scaleToFill
        
        configureSettingsLabel()
        
        mainStackView.addArrangedSubview(settingsLabel)
        mainStackView.addArrangedSubview(statusLabel)
    }
    
    func configureDetailSettingStackView() {
        self.addSubview(detailStackView)
        
        detailStackView.axis = .vertical
        detailStackView.alignment = .fill
        detailStackView.distribution = .fill
        detailStackView.spacing = 0.0
        detailStackView.contentMode = .scaleToFill
        
        detailStackView.addArrangedSubview(detailSettingsLabel)
        detailStackView.addArrangedSubview(mainStackView)
        setupConstraintsForDetailStackView()
    }
    
    func setupConstraintsForDetailStackView() {
        detailStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        detailStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        detailStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        detailStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20).isActive = true
    }
}
