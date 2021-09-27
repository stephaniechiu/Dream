//
//  JournalViewController.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/21/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController, UITableViewDelegate {	

	// MARK: - Properties

	let journalView = JournalView()
	let cellReuseID = "cell"
	let tableView = UITableView()

	// MARK: - Lifestyle

	override func viewDidLoad() {
		super.viewDidLoad()
		view = journalView
		setupTableView()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}

	func setupTableView() {
		tableView.delegate = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
		tableView.tableFooterView = UIView()
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
}
