//
//  StringExt.swift
//  BBQuotes
//
//  Created by Mayur Limbekar on 13/09/25.
//

extension String {
    func removeSpace() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeSpaveAndLowercased() -> String {
        self.removeSpace().lowercased()
    }
}
