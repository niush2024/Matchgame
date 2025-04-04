//
//  ContentView.swift
//  Memory Match
//
//  Created by StudentPM on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",]
    @State private var count: Int = 0
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack {
                    Image("Image") // background for the game screen
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    VStack{
                        Spacer()
                        // game title
                        Text("EmojiMatch")
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .cornerRadius(10)

                       
                        Spacer()
                        // Navigation to gameplay screen
                        NavigationLink(destination: Gameplay().navigationBarBackButtonHidden(true)){
                            Text("Start")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .font(.title)
                                .fontWeight(.semibold)
                            
                            
                        }
                        
                        Spacer()

                        
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
