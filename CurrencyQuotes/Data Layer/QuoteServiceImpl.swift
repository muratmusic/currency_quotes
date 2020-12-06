//
//  QuoteServiceImpl.swift
//  CurrencyQuotes
//
//  Created by Murat Dzhusupov on 01.11.2020.
//

import Foundation

class QuoteServiceImpl: QuoteService {
    func reload() {
        getQuotes(onSuccess: {}, onError: { _ in })
    }

    /**
    http://data.fixer.io/api/latest?access_key=0045562d9bb5b30b4a0b98d3d71adf81&format=1

    ? access_key = YOUR_ACCESS_KEY
    & base = GBP
    & symbols = USD,AUD,CAD,PLN,MXN
    */
    func getQuotes(onSuccess: @escaping () -> Void,
        onError: @escaping (Error) -> Void) {
        URLSession.shared.dataTask(with: Api.quotesURL) { result in
            switch result {
            case let .success((response, data)):
                    print("RESPONSE: \(response)")
                    if let json = String(data: data, encoding: .utf8) {
                        print("json: \(json)")
                    } else {
                        DispatchQueue.main.async {
                            onError(Errors.unparsableJSON)
                        }
                    }
                case let .failure(error):
                    DispatchQueue.main.async {
                        onError(error)
                    }
            }
        }.resume()
    }
}
