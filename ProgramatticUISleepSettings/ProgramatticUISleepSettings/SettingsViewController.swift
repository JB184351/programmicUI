//
//  ViewController.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/10/20.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var tableView = UITableView()
    var sleepLabel = UILabel()
    var settingsDataSource = [[SettingsProtocol]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = UIColor(red: 17/255, green: 22/255, blue: 38/255, alpha: 1)
        tableView.backgroundColor = UIColor(red: 17/255, green: 22/255, blue: 38/255, alpha: 1)
        
        self.tableView.rowHeight = UITableView.automaticDimension
        
        registerCells()
        setupUI()
        setupConstraints()
        createSettingObjects()
    }
    
    func setupUI() {
        view.addSubview(sleepLabel)
        view.addSubview(tableView)
        
        sleepLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        sleepLabel.text = "Sleep Settings"
        sleepLabel.textAlignment = .center
        sleepLabel.textColor = .white
    }
    
    func setupConstraints() {
        sleepLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        sleepLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        sleepLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        tableView.topAnchor.constraint(equalTo: sleepLabel.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func registerCells() {
        tableView.register(SwitchSettingsTableViewCell.self, forCellReuseIdentifier: "switchCell")
        tableView.register(SleepSettingsTableViewCell.self, forCellReuseIdentifier: "sleepCell")
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: "favoritesCell")
        tableView.register(SectionHeaderTableViewCell.self, forCellReuseIdentifier: "sectionCell")
    }
    
    func createSettingObjects() {
        
        let newFavorite = SettingsFavoritesModel(title: "+ New Favorite") {
            let addedFavorite = SettingsFavoritesModel(title: "Newer Favorite") {
                print("added")
            }
            
            self.settingsDataSource[0].append(addedFavorite)
            self.tableView.reloadData()
        }
        
        let wakeupTime = SettingsModel(setting: "Wakeup Time", settingDetails: "What time should you wake up?", settingStatus: "7:30 AM", cellType: .label) {
            print("Let's wake up!")
        }
        
        let sleepAlarmSettings = SettingsModel(setting: "Sleep Alarm Settings", settingDetails: nil, settingStatus: "On", cellType: .label) {
            print("Toggle Setting")
        }
        
        let dreamScape = SettingsModel(setting: "Dreamscape", settingDetails: "What music would you like to hear", settingStatus: "Random", cellType: .label) {
            print("Toggle Dreamscape settings")
        }
        
        let narration = SettingsModel(setting: "Narration", settingDetails: "What narraion would you like to hear?", settingStatus: "Classic Pzizz Sleep", cellType: .label) {
            print("Change narration setings")
        }
        
        let voice = SettingsModel(setting: "Voice", settingDetails: "Which voice would you like to hear?", settingStatus: "Bethany", cellType: .label) {
            print("Change voice settings")
        }
        
        let loop = SettingsModel(setting: "Loop Narration", settingDetails: "Toggle if the narration should loop until  your voice fade out time", settingStatus: nil, cellType: .button) {
            print("Loop Narration Action")
        }
        
        let music = SettingsModel(setting: "Music fade out", settingDetails: "Amount of time before music stops playing", settingStatus: "1hr 20min", cellType: .label) {
            print("Fade out setings")
        }
        
        let voiceFade = SettingsModel(setting: "Voice Fade", settingDetails: "Amount of time before voice stops playing", settingStatus: "1hr 20min", cellType: .label) {
            print("Voice fade out settings")
        }
        
        let musicWakeup = SettingsModel(setting: "Music wakeup section", settingDetails: "Sequence that plays at the end of a session and gently brings you back from sleep Note: the wakeup section won't play for seesion less than ten minutes", settingStatus: nil, cellType: .button) {
            print("Music Wakeup Section")
        }
        
        let threeDeeVoice = SettingsModel(setting: "3D voice", settingDetails: "Enjoy an immersive surrround sound effect with the voice. Best with headphones", settingStatus: nil, cellType: .button) {
            print("3D Voice")
        }
        
        let threeDeeVoiceSpeed = SettingsModel(setting: "3D voice speed", settingDetails: "Amount of time it takes for hte 3D voice effect to simulate a full revolution around your head", settingStatus: "18s", cellType: .label) {
            print("3D Voice Speed")
        }
        
        let delayStart = SettingsModel(setting: "Delay start", settingDetails: "Amount of time before session starts playing", settingStatus: "Off", cellType: .label) {
            print("Delay start")
        }
        
        let ratings = SettingsModel(setting: "Ratings", settingDetails: "Rate your session after completion", settingStatus: nil, cellType: .button) {
            print("Give a rating")
        }
        
        let audioFusion = SettingsModel(setting: "Audio Fusion", settingDetails: "Allow Pzizz to play in the background while other audio plays", settingStatus: nil, cellType: .button) {
            print("Audio Fusion")
        }
        
        
        let zeroSection = [newFavorite]
        settingsDataSource.append(zeroSection)
        
        let firstSection = [wakeupTime, sleepAlarmSettings]
        settingsDataSource.append(firstSection)
        
        let secondSection = [dreamScape, narration, voice, loop, music, voiceFade, musicWakeup, threeDeeVoice, threeDeeVoiceSpeed, delayStart]
        settingsDataSource.append(secondSection)
        
        let thirdSection = [ratings, audioFusion]
        settingsDataSource.append(thirdSection)
    }
    
    
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return settingsDataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settingsDataSource[indexPath.section][indexPath.row] as? SettingsModel
        
        if indexPath.section == 0 {
            let favoritesCell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell", for: indexPath) as! FavoritesTableViewCell
            favoritesCell.setup(with: settingsDataSource[indexPath.section] as! [SettingsFavoritesModel])
            return favoritesCell
        }
        
        switch setting!.cellType {
        case .button:
            let buttonTypeCell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchSettingsTableViewCell
            buttonTypeCell.setup(with: setting!)
            return buttonTypeCell
        case .label:
            let settingsCell = tableView.dequeueReusableCell(withIdentifier: "sleepCell", for: indexPath) as! SleepSettingsTableViewCell
            settingsCell.setup(with: setting!)
            return settingsCell
        }
    }
    
    
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = settingsDataSource[indexPath.section][indexPath.row] as! SettingsModel
        let selectedSetting = setting.action
        selectedSetting()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let sectionHeaderCell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! SectionHeaderTableViewCell
            sectionHeaderCell.sectionHeaderLabel.text = "Alarm Settings"
            return sectionHeaderCell
        case 2:
            let sectionHeaderCell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! SectionHeaderTableViewCell
            sectionHeaderCell.sectionHeaderLabel.text = "Sleep Settings"
            return sectionHeaderCell
        case 3:
            let sectionHeaderCell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! SectionHeaderTableViewCell
            sectionHeaderCell.sectionHeaderLabel.text = "General Settings"
            return sectionHeaderCell
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.0
        default:
            return 50.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

