//
//  KakaoLoginManager.swift
//  Summar SwiftUI
//
//  Created by ukBook on 2022/11/15.
//

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class KakaoLoginManager : ObservableObject {
    @Published var SignUpBool = false
    @Published var GoHomeBool = false
    
    func kakaoLogin() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                print("loginWithKakaoTalk oauthToken =>\n", oauthToken)
                print("loginWithKakaoAccount error =>\n", error)
                self.getUserInfo()
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                print("loginWithKakaoAccount oauthToken =>\n", oauthToken)
                print("loginWithKakaoAccount error =>\n", error)
                self.getUserInfo()
            }
        }
    }
    
    func getUserInfo() {
        UserApi.shared.me { User, Error in
            if let id = User?.id {
//                userName = name
                print("id => ", id)
                self.SignUpBool = true
            }
            
             if let name = User?.kakaoAccount?.profile?.nickname {
//                userName = name
                 print("name => ", name)
             }
             if let mail = User?.kakaoAccount?.email {
//                userMail = mail
                 print("mail => ", mail)
             }
             if let profile = User?.kakaoAccount?.profile?.profileImageUrl {
//                profileImage = profile
                 print("profile => ", profile)
             }
        }
    }
}
