//
//  SettingsFavoritesModel.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/12/20.
//

import Foundation

struct SettingsFavoritesModel: SettingsProtocol {
  var title: String?
  var action: () -> Void
}
