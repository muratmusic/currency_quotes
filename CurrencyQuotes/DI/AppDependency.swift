//
//  AppDependency.swift
//  CurrencyQuotes
//
//  Created by Murat Dzhusupov on 01.11.2020.
//

import Foundation
import DITranquillity

/**
    Sample how to use
        let someObj: ISomeClass = AppDependency.container.resolve()
*/
class AppDependency: DIFramework {
    static let container: DIContainer = {
        let container = DIContainer()
        container.append(framework: AppDependency.self)
        return container
    }()
    
    static func load(container: DIContainer) {
        
        // Register storyboards
        container.registerStoryboard(name: "Main")
           
        // Register services
        container.register(QuoteServiceImpl.init)
            .as(check: QuoteService.self) {$0}
            .lifetime(.single)
            
        /*
        container.register(CatalogService.init)
            .as(check: ICatalogService.self) {$0}
            .injection(\.db)
            .injection(\.settings)
            .injection(\.parser)
            .lifetime(.single)
        */
        
        // Register view model and view controllers

        container.register(QuoteViewModelImpl.init)
            .as(check: QuoteViewModel.self) {$0}
            .injection(\.service)
            .lifetime(.objectGraph)
        container.register(QuoteController.self)
            .injection(\.viewModel)
            .lifetime(.objectGraph)
    }
    
}
