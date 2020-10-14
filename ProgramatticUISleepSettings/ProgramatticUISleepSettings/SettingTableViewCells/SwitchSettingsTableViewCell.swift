//
//  SwitchSettingsTableViewCell.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/12/20.
//

import UIKit

class SwitchSettingsTableViewCell: UITableViewCell {
    
    var settingsLabel = UILabel()
    var detailSettingsLabel = UILabel()
    var settingsSwitch = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(settingsLabel)
        addSubview(detailSettingsLabel)
        addSubview(settingsSwitch)
        
        configureSettingsLabel()
        configureDetailSettingsLabel()
        configureSettingsSwitch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSettingsLabel() {
        
    }
    
    func configureDetailSettingsLabel() {
        
    }
    
    func configureSettingsSwitch() {
        
    }

}
