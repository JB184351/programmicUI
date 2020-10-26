//
//  Extensions.swift
//  ProgramatticUISleepSettings
//
//  Created by Justin Bengtson on 10/22/20.
//

import Foundation
import UIKit

extension UIColor {
   
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
     
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
   
  public convenience init(hex: Int, alpha: Double = 1.0) {
    let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
    let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
    let b = CGFloat(hex & 0x0000FF) / 255.0
    self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
  }
   
  convenience init(hexString: String) {
    var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
     
    if (cString.hasPrefix("#")) {
      cString.remove(at: cString.startIndex)
    }
     
    guard cString.count == 6 else {
      self.init()
      return
    }
     
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
     
    self.init(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
   
  func toHex(alpha: Bool = false) -> String? {
    guard let components = cgColor.components, components.count >= 3 else {
      return nil
    }
     
    let r = Float(components[0])
    let g = Float(components[1])
    let b = Float(components[2])
    var a = Float(1.0)
     
    if components.count >= 4 {
      a = Float(components[3])
    }
     
    if alpha {
      return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
    } else {
      return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
  }
   
}
