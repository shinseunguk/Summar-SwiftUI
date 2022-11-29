//
//  ContentView.swift
//  Summar SwiftUI
//
//  Created by ukBook on 2022/11/14.
//

import SwiftUI

let screenSize = UIScreen.main.bounds.size

struct SocialLoginView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("나만의 커리어를 위한\n써머리 만들기")
                    .lineSpacing(10)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(UIColor.summarColor1))
                    .padding(.top, 20)
                Spacer()
                Image("SocialLoginImage")
                    .padding(.bottom, -15)
                    .zIndex(1)
                KakaoBtnView()
                    .zIndex(0)
                AppleBtnView()
                    .padding(.top, 5)
                NaverBtnView()
                    .padding(.top, 5)
                GoogleBtnView()
                    .padding(.top, 5)
                    .padding(.bottom, 50)
            }
            .padding(20)
            .background(Color.white)
        }
    }
}

fileprivate struct KakaoBtnView: View {
    @ObservedObject var kakaoAuth = KakaoLoginManager()
    
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View{
        VStack{
            Button(action: {kakaoAuth.kakaoLogin()}) {
                    Image("kakao")
                    Text("카카오톡으로 시작하기")
                        .frame(width: screenSize.width - 120, height: 30, alignment: .center)
                        .font(.system(size: 18, weight: .bold))
                }
//            .padding()
            .frame(width: screenSize.width - 50,height: 55, alignment: .center)
            .foregroundColor(.black)
            .background(Color(UIColor.kakaoColor))
            .cornerRadius(4)
        }
        NavigationLink(destination: HomeView(), isActive: self.$kakaoAuth.SignUpBool) {}
        NavigationLink(destination: HomeView(), isActive: self.$kakaoAuth.GoHomeBool) {Spacer()}
    }
}

fileprivate struct AppleBtnView: View {
    var appleAuth = AppleLoginManager()
    
    var body: some View{
        VStack{
            Button(action: {appleAuth.appleLogin()}) {
                    Image("apple")
                    Text("애플계정으로 시작하기")
                    .frame(width: screenSize.width - 120, height: 30, alignment: .center)
                    .font(.system(size: 18, weight: .bold))
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 55, alignment: .center)
                .foregroundColor(.white)
                .background(Color(UIColor.appleColor))
                .cornerRadius(4)
        }
    }
}

fileprivate struct NaverBtnView: View {
    var naverAuth = NaverLoginManager()
    var body: some View{
        VStack{
            Button(action: {naverAuth.naverLogin()}) {
                    Image("naver")
                    Text("네이버로 시작하기")
                        .frame(width: screenSize.width - 120, height: 30, alignment: .center)
                        .font(.system(size: 18, weight: .bold))
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 55, alignment: .center)
                .foregroundColor(.white)
                .background(Color(UIColor.naverColor))
                .cornerRadius(4)
        }
    }
}

fileprivate struct GoogleBtnView: View {
    @ObservedObject var googleAuth = GoogleLoginManager()
    
    var body: some View{
        VStack{
            Button(action: {googleAuth.signIn()}) {
                HStack{
                    Image("google")
                }
                .border(.red)
                
                Text("구글로 시작하기")
                    .frame(width: screenSize.width - 120, height: 30, alignment: .center)
                    .font(.system(size: 18, weight: .bold))
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 55, alignment: .center)
                .foregroundColor(.white)
                .background(Color(UIColor.googleColor))
                .cornerRadius(4)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SocialLoginView()
    }
}
