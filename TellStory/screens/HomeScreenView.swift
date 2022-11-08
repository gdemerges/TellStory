//
//  HomeScreenView.swift
//  TellStory
//
//  Created by Guillaume Demergès on 20/10/2022.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationView(){
            VStack {
                NavigationLink(destination: StartGameSoloView()){
                    Text("Lancer une partie solo")
                }
                Text("Lancer une partie online")
                Text("Paramètres")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
