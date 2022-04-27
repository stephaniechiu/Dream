//
//  JournalViewController.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/21/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

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

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()


    var data: [String] = ["dog", "cow", "mouse"]

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupCollectionView()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}

    func addSubviews() {
        view.addSubview(headerContainer)
        headerContainer.addSubview(mainHeaderLabel)
        headerContainer.addSubview(dateHeaderLabel)

        view.addSubview(containerView)
        containerView.addSubview(collectionView)
    }

	func setupCollectionView() {
		addSubviews()

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self

		NSLayoutConstraint.activate(
			[
                // Header
				headerContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
				headerContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
				headerContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
				headerContainer.heightAnchor.constraint(equalToConstant: 160),
				mainHeaderLabel.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
				mainHeaderLabel.topAnchor.constraint(equalTo: headerContainer.topAnchor),

				dateHeaderLabel.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
				dateHeaderLabel.topAnchor.constraint(equalTo: mainHeaderLabel.bottomAnchor, constant: 8),

				// Collection View
				containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
				containerView.topAnchor.constraint(equalTo: headerContainer.bottomAnchor),
				containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
				containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

				collectionView.topAnchor.constraint(equalTo: containerView.topAnchor),
				collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
				collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
				collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
			]
		)
	}

	func selectedCell(row: Int) {
		print("Row: \(row)")
	}

    // MARK: - CollectionView Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    // MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .orange
        return cell
    }
}