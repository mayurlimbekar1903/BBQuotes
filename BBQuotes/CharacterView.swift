//
//  CharacterView.swift
//  BBQuotes
//
//  Created by Mayur Limbekar on 12/09/25.
//

import SwiftUI

struct CharacterView: View {
    let character:Char
    let show:String
    
    var body: some View {
        GeometryReader { geo in
            
            ScrollViewReader { proxy in
                
                
                ZStack(alignment: .top) {
                    Image(show.removeSpaveAndLowercased())
                        .resizable()
                        .scaledToFit()
                    ScrollView {
                        
                        TabView {
                            ForEach(character.images, id: \.self) { charact in
                                AsyncImage(url: charact) { image in
                                    image.resizable()
                                        .scaledToFill()
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }.tabViewStyle(.page)
                            .frame(width: geo.size.width/1.2, height: geo.size.height/1.7)
                            .clipShape(.rect(cornerRadius: 25))
                            .padding(.top, 60)
                        
                        
                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.largeTitle)
                            
                            Divider()
                            Text("Portrayed By: \(character.portrayedBy)")
                                .font(.title2)
                            
                            Text("Born: \(character.birthday)")
                            
                            Divider()
                            
                            Text("💼 Occupations")
                            
                            ForEach(character.occupations, id: \.self) { occupation in
                                Text("➤ \(occupation)")
                            }
                            
                            Divider()
                            
                            Text("Nicknames")
                            
                            if character.aliases.count > 0 {
                                ForEach(character.aliases, id: \.self) { alias in
                                    Text("➤ \(alias)")
                                        .font(.subheadline)
                                }
                            } else {
                                Text("None")
                                    .font(.subheadline)
                            }
                            
                            Divider()
                            
                            DisclosureGroup("Status (Spoiler Alert)") {
                                VStack(alignment: .leading) {
                                    Text(character.status)
                                        .font(.title2)
                                    if let death = character.death {
                                        
                                        AsyncImage(url: death.image) { img in
                                            img.resizable()
                                                .scaledToFit()
                                                .clipShape(.rect(cornerRadius: 10))
                                                .onAppear() {
                                                    withAnimation {
                                                        proxy.scrollTo(1, anchor: .bottom)
                                                    }
                                                }
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        Text("How \(death.details)")
                                            .padding(.bottom, 7)
                                        
                                        Text("Last word \(death.lastWords)")
                                    }
                                }
                            }
                            .tint(.primary)
                        }.frame(width: geo.size.width/1.25, alignment: .leading)
                            .padding()
                            .id(1)
                    }.scrollIndicators(.hidden)
                }
                
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    CharacterView(character: ViewModel().char, show: Conststant.bbName)
}
