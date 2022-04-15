//
//  JournalViewController.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/21/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	// MARK: - Properties

	let headerContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	let mainHeaderLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Nunito", size: 40.0)
		label.font = label.font.withSize(40)
		label.textColor = UIColor.darkBlueTint
		label.text = "Good Morning 🐣"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	let dateHeaderLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Nunito", size: 16.0)
		label.textColor = UIColor.darkBlueTint
		label.text = "Sunday, September 19, 2021"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	let tableView: UITableView = {
		let tableView = UITableView()
		tableView.tableFooterView = UIView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		return tableView
	}()

	let containerView: UIView = {
		let view = UIView()
		view.backgroundColor = .red
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

    let cellID = "cellID"
    var data: [String] = ["dog", "cow", "mouse"]
//	var tableViewDataSource: JournalTableViewDataSource?
//	var tableViewDelegate: JournalTableViewDelegate?

	// MARK: - Lifestyle

	override func viewDidLoad() {
		super.viewDidLoad()
//		view = journalHeaderView
		setupTableView()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}

	func setupTableView() {
		addSubviews()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
//
//		tableView.delegate = tableViewDelegate
//		tableView.dataSource = tableViewDataSource
//		tableView.translatesAutoresizingMaskIntoConstraints = false
//		journalHeaderView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate(
			[
				headerContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
				headerContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
				headerContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
				headerContainer.heightAnchor.constraint(equalToConstant: 160),
				mainHeaderLabel.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
				mainHeaderLabel.topAnchor.constraint(equalTo: headerContainer.topAnchor),

				dateHeaderLabel.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
				dateHeaderLabel.topAnchor.constraint(equalTo: mainHeaderLabel.bottomAnchor, constant: 8),

				// Table view
				containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
				containerView.topAnchor.constraint(equalTo: headerContainer.bottomAnchor),
				containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
				containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

				tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
				tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
				tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
				tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
			]
		)
	}

	func addSubviews() {
		view.addSubview(headerContainer)
		headerContainer.addSubview(mainHeaderLabel)
		headerContainer.addSubview(dateHeaderLabel)

		view.addSubview(containerView)
		containerView.addSubview(tableView)
	}

	func selectedCell(row: Int) {
		print("Row: \(row)")
	}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
