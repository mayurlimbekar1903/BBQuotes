//
//  ViewModel.swift
//  BBQuotes
//
//  Created by Mayur Limbekar on 21/08/25.
//

import Foundation

@Observable
@MainActor
class ViewModel {
    enum FetchStatus {
        case notstarted
        case fetching
        case completed
        case failed(error: Error)
    }
    
    private(set) var status = FetchStatus.notstarted
    private let fetcher = FetchService()
    
    var quote: Quote
    var char: Char
    
    init () {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let quoteData = try! Data(contentsOf: Bundle.main.url(forResource: "samplequote", withExtension: "json")!)
        quote = try! decoder.decode(Quote.self, from: quoteData)
        
        let charData = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
        char = try! decoder.decode(Char.self, from: charData)
    }
    
    
    func getData(for show: String) async {
        status = .fetching
        do {
            quote = try await fetcher.fetchQuotes(from: show)
            char = try await fetcher.fetchCharacters(quote.character)
            char.death = try await fetcher.fetchDeaths(for: char.name)
            status = .completed
        } catch {
            status = .failed(error: error)
        }
    }
}
