//
//  Errors.swift
//  CurrencyQuotes
//
//  Created by Murat Dzhusupov on 01.11.2020.
//

import Foundation

enum Errors: Error {
    case errorWithMsg(String)
    case connectionLost
    case serverError
    case unparsableJSON
    case unknown
}
