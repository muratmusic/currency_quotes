//
//  QuoteService.swift
//  CurrencyQuotes
//
//  Created by Murat Dzhusupov on 01.11.2020.
//

import Foundation

protocol QuoteService {
    func reload()

    func getQuotes(onSuccess: @escaping () -> Void,
        onError: @escaping (Error) -> Void)
}
