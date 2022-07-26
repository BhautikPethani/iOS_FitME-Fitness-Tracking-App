
import Foundation
import UIKit
import SwiftyJSON

struct DeviceDetail {
    
    /// Device Type
    static let deviceType = "ios"
    
    /// Device Model
    static var deviceModel : String {
        return UIDevice.current.model
    }
    
    /// OS Version
    static var osVersion : String {
        return UIDevice.current.systemVersion
    }
    
    /// Platform
    static var platform : String {
        return UIDevice.current.systemName
    }
    
    /// Device Id
    static var deviceId : String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    static var deviceToken = "DummyDeviceToken"
    
    static var fcmToken = "DummyFcmToken"
}

extension UIDevice {
    
    static var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhoneX
        default:
            return .unknown
        }
    }
    
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    enum ScreenType: String {
        case iPhone4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhoneX = "iPhone X"
        case unknown
    }
}
