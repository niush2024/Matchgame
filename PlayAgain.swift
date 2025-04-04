//
//  PlayAgain.swift
//  Memory Match
//
//  Created by StudentPM on 4/1/25.
//

import SwiftUI

struct PlayAgain: View {
    var body: some View {
        NavigationView{
            ZStack{
                Circle()
                
                    .fill(Color(red: 1.0, green: 0.6, blue:0.6))
                    .position(x:90 , y:0)
                
                Circle()
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.5))
                    .position(x:323  , y:700)
                
                VStack(spacing: 20){
                    Text("😃")
                        .font(.system(size: 143, weight: .bold))
                    Text("Great job!")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    
                    NavigationLink(destination: Gameplay().navigationBarBackButtonHidden(true)){
                    Text("Play Again")
                            .navigationBarBackButtonHidden()
                            .padding(.horizontal, 30)
                            .padding(.vertical, 15)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius (9)
                            .font(.system(size: 23, weight: .bold))
                            
                    
                    
                    //               Spacer()
                    
                    
                        }
                    }
            
            
                }
            
        }
    }
}

#Preview {
    PlayAgain()
}
