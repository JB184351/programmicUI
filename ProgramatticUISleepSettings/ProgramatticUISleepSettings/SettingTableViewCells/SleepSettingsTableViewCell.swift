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
    
    func setup(with model: SettingsModel) {
        settingsLabel.text = model.setting
        detailSettingsLabel.text = model.settingDetails
        statusLabel.text = model.settingStatus! + " >"
    }

}
