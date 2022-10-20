//
//  LoginView.swift
//  TellStory
//
//  Created by Guillaume Demergès on 20/10/2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Text("Tell Story")
            FormBox()
        }.padding(.all, 36)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct FormBox: View{
    @State var email:String = ""
    @State var passeword:String = ""
    
    var body: some View{
        VStack (alignment: .center, spacing: 15){
            Text("Email")
                .font(.callout).bold()
            TextField("exemple@exemple.com", text: $email)
                .textFieldStyle(.roundedBorder)
            Text("Password")
                .font(.callout).bold()
            SecureField("password", text: $passeword)
                .textFieldStyle(.roundedBorder)
            Text("Mot de passe oublié ?")
            
            NavigationLink(destination: HomeScreenView(), label: {
                Text("Se connecter")
            })
                    .buttonStyle(.borderedProminent)
                        .tint(.black)
            NavigationLink(destination: RegisterView()){
                Text("Vous n'avez pas de compte ?")
            }
            }
        .padding(.all, 36)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(20)
    }
}

