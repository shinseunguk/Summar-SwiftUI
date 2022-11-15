//
//  SocialLoginViewModel.swift
//  Summar SwiftUI
//
//  Created by ukBook on 2022/11/15.
//

import Foundation

class SocialLoginViewModel: ObservableObject {
    
    let kakaoLoginM = KakaoLoginManager()
    let appleLoginM = AppleLoginManager()
    let naverLoginM = NaverLoginManager()
    let googleLoginM = GoogleLoginManager()
    
    
    @Published var isFlashOn = false
    @Published var isSilentModeOn = false
    
    
//    func switchFlash() {
//        isFlashOn.toggle()
//    }
//
//    func switchSilent() {
//        isSilentModeOn.toggle()
//    }
    
    func kakaoLogin() {
        print(#function)
    }
    
    func appleLogin() {
        print(#function)
        appleLoginM.appleLogin()
    }
    
    func naverLogin() {
        print(#function)
        naverLoginM.naverLogin()
    }
    
    func googleLogin() {
        print(#function)
    }
    
//    init() {
//    }
}
