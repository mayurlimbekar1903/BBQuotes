//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Mayur Limbekar on 21/08/25.
//

import SwiftUI

struct QuoteView: View {
    let vm = ViewModel()
    let show: String
    
    @State var showCharView:Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                VStack {
                VStack {
                    Spacer(minLength: 60)
                    
                    switch vm.status {
                    case .notstarted:
                        EmptyView()
                    case .fetching:
                        ProgressView()
                    case .completed:
                        Text("\"\(vm.quote.quote)\"")
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .padding()
                            .background(.black.opacity(0.5))
                            .clipShape(.rect(cornerRadius: 25))
                        
                        ZStack(alignment: .bottom) {
                            AsyncImage(url: vm.char.images[0]) { image in
                                image.resizable()
                                    .scaledToFill()
                                
                            } placeholder: {
                                ProgressView()
                            }.frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                            
                            Text(vm.quote.character)
                                .foregroundColor(.white)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(.ultraThinMaterial)
                            
                        }.frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                            .clipShape(.rect(cornerRadius: 25))
                            .onTapGesture {
                                showCharView.toggle()
                            }
                        
                    case .failed(error: let error):
                        Text("\(error.localizedDescription)")
                    }
                    
                    
                    Spacer()
                }
                    Button {
                        Task {
                            await vm.getData(for: show)
                        }
                    } label: {
                        Text("Get Random Quote")
                    }.font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color("\(show.replacingOccurrences(of: " ", with: ""))Button"))
                        .clipShape(.rect(cornerRadius: 12))
                        .shadow(color: Color("\(show.replacingOccurrences(of: " ", with: ""))Shadow"),radius: 2)
                    
                    Spacer(minLength: 95)
                    
                }.frame(width: geo.size.width, height: geo.size.height)
                
            }.frame(width: geo.size.width, height: geo.size.height)
            
            
        }.ignoresSafeArea()
            .sheet(isPresented: $showCharView) {
                CharacterView(character: vm.char, show: show)
            }
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
}
