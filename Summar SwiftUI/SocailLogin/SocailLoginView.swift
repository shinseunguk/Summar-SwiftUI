//
//  ContentView.swift
//  Summar SwiftUI
//
//  Created by ukBook on 2022/11/14.
//

import SwiftUI

struct SocailLoginView: View {
    @ObservedObject var viewModel = SocialLoginViewModel()
    
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        VStack {
            Text("나만의 커리어를 위한\n써머리 만들기")
                .lineSpacing(10)
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(UIColor.summarColor1))
            
            Spacer()
            Button(action: {viewModel.kakaoLogin()}) {
                    Image("kakao")
                    Text("카카오톡으로 시작하기")
                        .padding(.horizontal)
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 62, alignment: .center)
                .foregroundColor(.black)
                .background(Color(UIColor.kakaoColor))
                .cornerRadius(4)
            
            Button(action: {viewModel.appleLogin()}) {
                    Image("apple")
                    Text("애플계정으로 시작하기")
                        .padding(.horizontal)
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 62, alignment: .center)
                .foregroundColor(.white)
                .background(Color(UIColor.appleColor))
                .cornerRadius(4)
            
            Button(action: {viewModel.naverLogin()}) {
                    Image("naver")
                    Text("네이버로 시작하기")
                        .padding(.horizontal)
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 62, alignment: .center)
                .foregroundColor(.white)
                .background(Color(UIColor.naverColor))
                .cornerRadius(4)
            
            Button(action: {viewModel.googleLogin()}) {
                Image("google")
                Text("구글로 시작하기")
                    .padding(.horizontal)
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 62, alignment: .center)
                .foregroundColor(.white)
                .background(Color(UIColor.googleColor))
                .cornerRadius(4)
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SocailLoginView()
    }
}
