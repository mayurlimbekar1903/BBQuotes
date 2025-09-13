//
//  Episode.swift
//  BBQuotes
//
//  Created by Mayur Limbekar on 13/09/25.
//

import Foundation

struct Episode: Decodable {
    let title: String
    let airDate: String
    let episode: Int
    let synopsis: String
    let writtenBy: String
    let directedBy: String
    let image: URL
    
    var seasonEpisode: String {
        "Season \(String(episode/100)) Episode \(String(episode%100))"
    }
}
