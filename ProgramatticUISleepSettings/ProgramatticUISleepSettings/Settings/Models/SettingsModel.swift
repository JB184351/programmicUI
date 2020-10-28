//
//  SettingsModel.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/12/20.
//

import Foundation

enum SettingsCellType {
  case button
  case label
}

struct SettingsModel: SettingsProtocol {
  var setting: String
  var settingDetails: String?
  var settingStatus: String?
  var cellType: SettingsCellType
  var action: () -> Void
}
