//
//  SearchController.swift
//  Dream
//
//  Created by Stephanie on 9/21/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    let searchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
