//
//  EpisodeView().swift
//  BBQuotes
//
//  Created by Mayur Limbekar on 13/09/25.
//

import SwiftUI

struct EpisodeView: View {
    let episode: Episode
    
    var body: some View {
        VStack {
        VStack(alignment: .leading){
      
                Text("\(episode.title)")
                    .font(.largeTitle)
                
                Text("\(episode.seasonEpisode)")
                    .font(.title2)
                
                AsyncImage(url: episode.image) {
                    image in
                    image.resizable()
                        .cornerRadius(15)
                } placeholder: {
                    ProgressView()
                }
                
                Text(episode.synopsis)
                    .font(.title3)
                    .minimumScaleFactor(0.5)
                    .padding(.bottom)
                
                Text("Written By: \(episode.writtenBy)")
                
                Text("Directed By: \(episode.directedBy)")
                
                Text("Aired \(episode.airDate)")
                
            }.padding()
        }
        .foregroundStyle(.white)
        .background(.black.opacity(0.6))
        .cornerRadius(25)
        .padding(.horizontal)
    }
}

#Preview {
    EpisodeView(episode: ViewModel().episode)
}
