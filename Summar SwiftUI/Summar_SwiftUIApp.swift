//
//  Summar_SwiftUIApp.swift
//  Summar SwiftUI
//
//  Created by ukBook on 2022/11/14.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct Summar_SwiftUIApp: App {
    
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: "c82291c69573fe735c2c917069993cd9")
    }
    
    var body: some Scene {
        WindowGroup {
            SocailLoginView()
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)){
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
