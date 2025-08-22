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
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    Text("\"\(vm.quote.quote)\"")
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
                    
                }.frame(width: geo.size.width)
            }.frame(width: geo.size.width, height: geo.size.height)
            
            
        }.ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
}
