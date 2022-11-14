//
//  ContentView.swift
//  Summar SwiftUI
//
//  Created by ukBook on 2022/11/14.
//

import SwiftUI

struct SocailLoginView: View {
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        VStack {
            Text("나만의 커리어를 위한\n써머리 만들기")
                .lineSpacing(10)
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(UIColor.summarColor1))
                .bold(true)
            
            Spacer()
            Button(action: {}) {
                    Image("kakao")
                    Text("카카오톡으로 시작하기")
                        .padding(.horizontal)
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 62, alignment: .center)
                .foregroundColor(.black)
                .background(Color(UIColor.kakaoColor))
                .cornerRadius(4)
                .bold(true)
            
            Button(action: {}) {
                    Image("apple")
                    Text("애플계정으로 시작하기")
                        .padding(.horizontal)
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 62, alignment: .center)
                .foregroundColor(.white)
                .background(Color(UIColor.appleColor))
                .cornerRadius(4)
                .bold(true)
            
            Button(action: {}) {
                    Image("naver")
                    Text("네이버로 시작하기")
                        .padding(.horizontal)
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 62, alignment: .center)
                .foregroundColor(.white)
                .background(Color(UIColor.naverColor))
                .cornerRadius(4)
                .bold(true)
            
            Button(action: {}) {
                Image("google")
                Text("구글로 시작하기")
                    .padding(.horizontal)
                }
                .padding()
                .frame(width: screenSize.width - 50,height: 62, alignment: .center)
                .foregroundColor(.white)
                .background(Color(UIColor.googleColor))
                .cornerRadius(4)
                .bold(true)
            
        }
        .cornerRadius(4)
        .padding(60)
    }
}

func buttonAction(){
    print("buttonAction")
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SocailLoginView()
    }
}
