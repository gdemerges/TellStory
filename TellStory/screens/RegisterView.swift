//
//  RegisterView.swift
//  TellStory
//
//  Created by Guillaume Demergès on 20/10/2022.
//

import SwiftUI

struct RegisterView: View {
    @State var username:String = ""
    @State var password3:String = ""
    @State var password2: String = ""
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    @State var isLogged: Bool = false
    
    func checkSubscription() throws{
        if username.isEmpty && password2.isEmpty && password2.isEmpty{
            throw UserError.loginPasswordEmpty
        }
        else if password2 != password3 {
            throw UserError.passwordNotMatching
        }
        else if password2.count < 6 || password2.isEmpty {
            throw UserError.invalidPassword
        }else{
            isLogged = true
        }
    }
    
    var body: some View {
        VStack {
            Text("TellStory")
                .font(.system(size: 50))
                .padding(.top,45)
            Spacer()
            VStack(spacing: 15){
                VStack(alignment: .center, spacing: 30){
                    VStack(alignment: .center) {
                        CustomTextfield(placeholder:
                                            Text("Pseudo"),
                                        fontName: "RobotoSlab-Light",
                                        fontSize: 18,
                                        fontColor: Color.gray,
                                        username: $username)
                        Divider()
                            .background(Color.gray)
                    }
                    VStack(alignment: .center) {
                        CustomSecureField(placeholder:
                                            Text("Mot de passe"),
                                          fontName: "RobotoSlab-Light",
                                          fontSize: 18,
                                          fontColor: Color.gray,
                                          password: $password2)
                        Divider()
                            .background(Color.gray)
                    }
                    VStack(alignment: .center) {
                        CustomSecureField(placeholder:
                                            Text("Confirmer mot de passe"),
                                          fontName: "RobotoSlab-Light",
                                          fontSize: 18,
                                          fontColor: Color.gray,
                                          password: $password3)
                        Divider()
                            .background(Color.gray)
                    }
                }
            }
            .padding(.horizontal,35)
            Text(errorMessage)
                .foregroundColor(.red)
            Button(action: {
                do {
                    try checkSubscription()
                } catch {
                    switch error {
                    case UserError.loginPasswordEmpty:
                        errorMessage = "Veuillez saisir un pseudo et mot de passe"
                    case UserError.invalidLogin:
                        errorMessage = "Identifiant invalide"
                    case UserError.invalidPassword:
                        errorMessage = "Mot de passe invalide"
                    default:
                        errorMessage = "Une erreur est survenue"
                    }
                }
            }, label: {
                ZStack{
                    Circle()
                        .foregroundColor(Color.blue)
                        .frame(width: 60, height: 60)
                    Image(systemName: "arrow.right")
                        .font(.title)
                        .foregroundColor(Color.white)
                }
                .padding(.top,35)
            })
            NavigationLink(destination: HomeScreenView(),isActive: $isLogged, label: {
                Text("")
            })

            Spacer()
        }
        .navigationTitle("Vos informations")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
