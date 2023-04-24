//
//  ContentView.swift
//  cluelessCloset
//
//  Created by Srishti Kamra  on 4/11/23.
//

// Sora was here~!
//erin was here!

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("Clueless")
                    .resizable()
                    .ignoresSafeArea()
                
                NavigationLink("Click Here!", destination:
                                SecondView())
                .fontDesign(.serif)
                .frame(width: 100)

                .font(.largeTitle)
                .foregroundStyle(.pink.gradient)
            }
            
            
        }
    }
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    }

