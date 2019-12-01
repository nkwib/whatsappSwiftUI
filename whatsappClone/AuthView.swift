//
//  AuthView.swift
//  whatsappClone
//
//  Created by nepta on 01/12/2019.
//  Copyright © 2019 nkiwb. All rights reserved.
//
import SwiftUI
import Firebase

struct AuthView: View {
    
    @State var userEmail: String = ""
    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
        NavigationView{
                VStack(alignment: .leading) {
                    Section {
                        SectionSubTitle(subtitle: "E-mail")
                        TextField("Enter your E-mail", text: $userEmail)
                    }
                    Section {
                    SectionSubTitle(subtitle: "Username")
                    TextField("Enter your Username", text: $username)
                    }
                    Section {
                        SectionSubTitle(subtitle: "Password")
                        TextField("Enter your Password", text: $password)
                    }
                    Section {
                        HStack{
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Text("Sign In")
                            }
                            .padding()
                            Spacer()
                        }
                    .padding()
                    }
                    Section {
                        HStack{
                            Spacer()
                            Button(action: {
                                Auth.auth().createUser(withEmail: self.userEmail, password: self.password) { (res, err) in
                                    if err != nil {
                                        print(err?.localizedDescription as Any)
                                    } else {
                                        //Database
                                    }
                                }
                            }) {
                                Text("Sign Up")
                            }
                            .padding()
                            Spacer()
                        }
                    .padding()
                    }
                    Spacer()
                }
            .padding()
        .navigationBarTitle(Text("Whatsapp Clone"))
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

struct SectionSubTitle: View {
    
    var subtitle: String
    
    var body: some View {
        Text(subtitle)
            .font(.subheadline)
            .foregroundColor(.blue)
    }
}

