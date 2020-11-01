//
//  QuoteController.swift
//  CurrencyQuotes
//
//  Created by Murat Dzhusupov on 01.11.2020.
//

import UIKit

class QuoteController: UIViewController {
    var viewModel: QuoteViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //viewModel.reloadQuotes()
    }
}

