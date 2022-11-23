//
//  GoogleLoginManager.swift
//  Summar SwiftUI
//
//  Created by ukBook on 2022/11/15.
//

import SwiftUI
import GoogleSignIn

class GoogleLoginManager: ObservableObject {
    
    @Published var givenName: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    @Published var email: String = ""
    @Published var userID: String = ""
    
    init(){
        check()
    }
    
    func checkStatus(){
        print(#function)
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            
            guard let user = user else { return }
//            let givenName = user.profile?.givenName
            let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
            let email = user.profile?.email
            let userId = user.userID
            
            self.userID = userId ?? "unknown"
            self.email = email ?? "unknown@gmail.com"
            self.profilePicUrl = profilePicUrl
            
            self.isLoggedIn = true
            
            print(self.userID)
            print(self.email)
            print(self.profilePicUrl)
            
        }else{
            self.isLoggedIn = false
            self.userID = "unknown"
            self.email = "unknown@gmail.com"
            self.profilePicUrl =  ""
        }
    }
    
    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            
            self.checkStatus()
        }
    }
    
    func signIn(){
        print(#function)
        
       guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let signInConfig = GIDConfiguration.init(clientID: "889837360140-2coemapf7ok8b2hbasf55s8rt01o7n90.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController,
            callback: { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                self.checkStatus()
            }
        )
    }
    
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}
