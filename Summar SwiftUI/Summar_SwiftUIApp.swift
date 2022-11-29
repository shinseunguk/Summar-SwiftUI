//
//  Summar_SwiftUIApp.swift
//  Summar SwiftUI
//
//  Created by ukBook on 2022/11/14.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import NaverThirdPartyLogin

@main
struct Summar_SwiftUIApp: App {
    
    init() {
        print("Summar_SwiftUIApp init")
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: "c82291c69573fe735c2c917069993cd9")
        
//        NaverThirdPartyLoginConnection.getSharedInstance()?.serviceUrlScheme = "Summar"
//        NaverThirdPartyLoginConnection.getSharedInstance()?.consumerKey = "vhRSDiuXtzI9d8oPXZL6"
//        NaverThirdPartyLoginConnection.getSharedInstance()?.consumerSecret = "Jop9G0kyP8"
//        NaverThirdPartyLoginConnection.getSharedInstance()?.appName = "Summar"
    }
    
    var body: some Scene {
        WindowGroup {
            SocialLoginView()
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)){
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
