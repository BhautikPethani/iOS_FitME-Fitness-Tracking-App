//
//  SignUp.swift
//  TechArmie_capstone1_FitME
//
//  Created by Swapnil Kumbhar on 2022-07-26.
//

import SwiftUI

struct SignUp: View {
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var cPassword: String = ""
    @State private var password: String = ""
    @State private var isEmailValid: Bool = true
    @State private var isNameValid: Bool = true
    @State private var isCPasswordValid: Bool = true
    @State private var isPasswordValid: Bool = true
    
    private var controller: SignUpController;
    init(controller: SignUpController) {
        self.controller = controller;
    }
    
    func textFieldValidatorEmail(value: String) -> Bool {
        return false
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Sign Up").bold().font(.title)
                    Text("Enter your details").font(.body)
                }.padding()
                Group {
                    ZStack (alignment: Alignment.bottomTrailing){
                        Image("user_profile").frame(width: 100, height: 100)
                        Button {
                            
                        } label: {
                            Image("Upload").frame(width: 20, height: 20)
                        }
                    }
                }
                EmptySpace()
                Group {
                    Group {
                        TextField("Name", text: $name, onEditingChanged: { (isChanged) in
                            if !isChanged {
                                if textFieldValidatorEmail(value: self.name) {
                                    self.isNameValid = true
                                } else {
                                    self.isNameValid = false
                                }
                            }
                        }).padding(.bottom, isNameValid ? 20 : 10).overlay(VStack{Divider().offset(x: 0, y: 10)})
                            
                        if !self.isNameValid {
                            HStack {
                                Text("Invalid name").font(.caption).foregroundColor(Color(red: 1, green: 0, blue: 0))
                                Spacer()
                            }
                        }
                    }
                    Group {
                        TextField("Email", text: $email, onEditingChanged: { (isChanged) in
                            if !isChanged {
                                if textFieldValidatorEmail(value: self.email) {
                                    self.isEmailValid = true
                                } else {
                                    self.isEmailValid = false
                                }
                            }
                        }).padding(.bottom, isEmailValid ? 20 : 10).overlay(VStack{Divider().offset(x: 0, y: 10)})
                            
                        if !self.isEmailValid {
                            HStack {
                                Text("Invalid email address").font(.caption).foregroundColor(Color(red: 1, green: 0, blue: 0))
                                Spacer()
                            }
                        }
                    }
                    Group {
                        SecureField("Password", text: $password) {
                        }
                            .padding(.bottom, isEmailValid ? 20 : 10)
                            .overlay(VStack{Divider().offset(x: 0, y: 10)})
                        if !self.isPasswordValid {
                            HStack {
                                Text("Invalid password length").font(.caption).foregroundColor(Color(red: 1, green: 0, blue: 0))
                                Spacer()
                            }
                        }
                    }
                    Group {
                        SecureField("Confirm Password", text: $cPassword)
                            .padding(.bottom, isCPasswordValid ? 20 : 10)
                            .overlay(VStack{Divider().offset(x: 0, y: 10)})
                        if !self.isCPasswordValid {
                            HStack {
                                Text("Password didn't match").font(.caption).foregroundColor(Color(red: 1, green: 0, blue: 0))
                                Spacer()
                            }
                        }
                    }
                }
                EmptySpace()
                
                Button {
                    if (password.isBlank || email.isBlank) {
                        if password.isBlank {isPasswordValid = false};
                        if email.isBlank {isEmailValid = false};
                        return
                    }
                    if password.count < 6 {
                        if password.isBlank {isPasswordValid = false}; return;
                    }
                    self.controller.emailPasswordFirebaseLogin(email: email, password: password, name: name);
                } label: {
                    Text("SIGN UP")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                }
                .background(Color(red: 0.149, green: 0.259, blue: 0.298))
                .frame(width: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                EmptySpace()
                Group {
                    Text("By continue, you agree to our")
                    Text("Privacy policy | Terms of Service").bold()
                }
            }
            .padding(.horizontal, 20)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.controller.navigationController?.popViewController(animated: true)
                    } label: {
                        Image("icBack")
                    }
                }
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(controller: SignUpController())
    }
}
