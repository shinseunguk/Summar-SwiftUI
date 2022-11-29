//  AppDelegate.swift
//  Summar SwiftUI
//
//  Created by ukBook on 2022/11/28.
//

import Foundation
import UIKit
import NaverThirdPartyLogin

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool{
//        // 네이버 앱으로 로그인 허용
//        NaverThirdPartyLoginConnection.getSharedInstance()?.isNaverAppOauthEnable = true
//        // 브라우저 로그인 허용
//        NaverThirdPartyLoginConnection.getSharedInstance()?.isInAppOauthEnable = true
//
//        // 네이버 로그인 세로모드 고정
//        NaverThirdPartyLoginConnection.getSharedInstance().setOnlyPortraitSupportInIphone(true)
//
//        NaverThirdPartyLoginConnection.getSharedInstance()?.serviceUrlScheme = "Summar"
//        NaverThirdPartyLoginConnection.getSharedInstance()?.consumerKey = "vhRSDiuXtzI9d8oPXZL6"
//        NaverThirdPartyLoginConnection.getSharedInstance()?.consumerSecret = "Jop9G0kyP8"
//        NaverThirdPartyLoginConnection.getSharedInstance()?.appName = "Summar"
    return true
  }
}
