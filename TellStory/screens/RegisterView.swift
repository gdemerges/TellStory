//
//  RegisterView.swift
//  TellStory
//
//  Created by Guillaume Demergès on 20/10/2022.
//

import SwiftUI

struct RegisterView: View {
    @State var username:String = ""
    @State var password:String = ""
    @State var password2: String = ""
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    
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
                                          password: $password)
                        Divider()
                            .background(Color.gray)
                    }
                    VStack(alignment: .center) {
                        CustomSecureField(placeholder:
                                            Text("Confirmer mot de passe"),
                                          fontName: "RobotoSlab-Light",
                                          fontSize: 18,
                                          fontColor: Color.gray,
                                          password: $password2)
                        Divider()
                            .background(Color.gray)
                    }
                }
            }
            .padding(.horizontal,35)
            NavigationLink(destination: HomeScreenView()){
                ZStack{
                    Circle()
                        .foregroundColor(Color.blue)
                        .frame(width: 60, height: 60)
                    Image(systemName: "arrow.right")
                        .font(.title)
                        .foregroundColor(Color.white)
                }
                .padding(.top,35)
            }
            Spacer()
        }
        .navigationTitle("Vos informations")
    }
    
    func checkSubscription() throws{
        if password.count < 6 {
            throw UserError.invalidPassword
        }else if password != password2 {
            throw UserError.passwordNotMatching
        }
    }
//    do {
//    showError = false
//     try checkSubscription()
//    } catch {
//    switch error {
//    case UserError.invalidPassword:
//    errorMessage = "Mot de passe invalide (6 caractères min)"
//    case UserError.passwordsNotMatching:
//    errorMessage = "Les mots de passe ne correspondent pas"
//    default:
//    errorMessage = "Une erreur est survenue"
//    }
//    showError = true
//    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
