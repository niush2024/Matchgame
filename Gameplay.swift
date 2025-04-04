//
//  Gameplay.swift
//  Memory Match
//
//  Created by StudentPM on 3/26/25.
//

import SwiftUI

struct Gameplay: View {
    @State private var score: Int = 0
    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄",].shuffled()
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 12)
    @State private var pickOne: Int = -1
    @State private var pickTwo: Int = -1


    
    let columns: [GridItem] = [
        GridItem(.fixed(50),  spacing: nil, alignment: nil),
        GridItem(.fixed(50),  spacing: nil, alignment: nil),
        GridItem(.fixed(50),  spacing: nil, alignment: nil)
        
    ]
    
    var body: some View {
        NavigationView{

            ZStack{
                Circle()
                
                    .fill(Color(red: 1.0, green: 0.6, blue:0.6))
                    .position(x:90 , y:0)
                
                Circle()
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.5))
                    .position(x:323  , y:700)
                
                
                
                
                VStack{
                    Text("Current Score:\(score)")
                        .font(.system(size:40, weight: .bold))
                        .foregroundColor(.black)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 9) {
                        ForEach(emojis.indices, id:\.self) { i in
                            Button(action: {handleClick(index: i)}){
                                CardView(emoji: emojis[i], isFlipped: cardsFlipped[i])
                            }
                        }
                    }
                    
                    if score == 6{
                    
                        HStack{
                            Button("Next"){}
                                .navigationBarBackButtonHidden()
                                 // remove the blue text in the corner
                                .padding(.horizontal, 30)
                                .padding(.vertical, 15)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius (9)
                                .font(.system(size: 23, weight: .bold))
                            NavigationLink(destination: PlayAgain().navigationBarBackButtonHidden(true)){
                                Text("Retry")
                                    //.navigationBarBackButtonHidden()
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 15)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius (9)
                                    .font(.system(size: 23, weight: .bold))
                            }
                            
                        }
                    }
                    
                }
                
            }
            
        }
    }
    
    func handleClick(index: Int){
        if cardsFlipped[index] || pickTwo != -1{
            return
        }
        
        cardsFlipped[index] = true
        
        
        //----------------------
        if pickOne  == -1{
            pickOne = index
        }else{
            pickTwo = index
            
            
            
            // Note:
            // waits 2 seconds for the player to see the card that they chose
            // Then it checks to see if it matchs with the emoji
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                if emojis[pickOne] == emojis[pickTwo] {
                    score += 1  // increase the score if matched
                } else{         // if not matched then flip them back to where they where
                    cardsFlipped[pickOne] = false
                    cardsFlipped[pickTwo] = false
                }
                
                // reset the selected cards indices for next turn
                pickOne = -1
                pickTwo = -1
                
                
                
            }
        }

        
    }
}

struct CardView: View{
    var emoji: String = ""  // The emoji symbol is to display
    var isFlipped: Bool = false
    
    var body: some View{
        ZStack{
            // Card background blue when face down and almost invisble when is like face up
            Text(emoji)
            RoundedRectangle(cornerRadius: 12)
                .fill(isFlipped == false ? Color.blue : Color.white.opacity(0.01))
                .frame(width: 90, height: 85)
                .shadow(color: .gray.opacity(0.3), radius: 5, x:5, y:5)
        }
    }
    
   
        
        
    }


#Preview {
    Gameplay()
}
