//
//  ContentView.swift
//  cluelessCloset
//
//  Created by Srishti Kamra  on 4/11/23.
//

// Sora was here
//erin was here

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Image("Clueless")
                .resizable()
                .ignoresSafeArea()
            
            NavigationLink("Click Here!", destination: SecondView())
                
            }
        
        
        }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    }

