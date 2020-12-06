//
//  NetworkConfig.swift
//  CurrencyQuotes
//
//  Created by Murat Dzhusupov on 01.11.2020.
//

import Foundation

/// See https://fixer.io/quickstart to get more info
class Api {
    //static let key = "0045562d9bb5b30b4a0b98d3d71adf81"
    static let quotesURL = URL(string:
        "http://data.fixer.io/api/latest?access_key=0045562d9bb5b30b4a0b98d3d71adf81&format=1")!

    static func quotesURL(base: String, symbols: [String]) -> URL {
        let queryItems = [
            URLQueryItem(name: "base", value: base),
            URLQueryItem(name: "symbols", value:
                symbols.joined(separator: ","))
        ]
        
        guard let result =
            quotesURL.appending(queryItems) else { return quotesURL }
        return result
    }
}
