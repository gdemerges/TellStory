//
//  LoginView.swift
//  TellStory
//
//  Created by Guillaume Demergès on 20/10/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @StateObject var viewModelUserView = usersViewModel()
    @State private var errorMessage = ""
    @State var isLogged: Bool = false
    
    func checkLogin() throws {
        if username.isEmpty && password.isEmpty{
            throw UserError.loginPasswordEmpty
        }
        else if username != viewModelUserView.user1.username{
            throw UserError.invalidLogin
        }else if password != viewModelUserView.user1.password{
            throw UserError.invalidPassword
        }else{
            isLogged = true
        }
    }
    
    var body: some View {
        NavigationView{
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
                    }
                    HStack{
                        Spacer()
                        Button(action: {}){
                            Text("Mot de passe oublié ?")
                                .modifier(CustomTextM(fontName: "RobotoSlab-Light", fontSize: 14, fontColor: Color.gray))
                        }
                    }
                }
                .padding(.horizontal,35)
                Text(errorMessage)
                    .foregroundColor(.red)
                Button(action: {
                    do {
                        try checkLogin()
                    } catch {
                        switch error {
                        case UserError.loginPasswordEmpty:
                            errorMessage = "Veuillez saisir votre pseudo et mot de passe"
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
                NavigationLink(destination: RegisterView()){
                    Text("Inscris toi, si tu es nouveau !")
                        .modifier(CustomTextM(fontName: "RobotoSlab-Light", fontSize: 18, fontColor: Color.blue))
                }
                .padding(.bottom,30)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CustomTextM: ViewModifier {
    //MARK:- PROPERTIES
    let fontName: String
    let fontSize: CGFloat
    let fontColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(fontColor)
    }
}
