//
//  JournalController.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/21/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit
import AVFoundation
import Speech
import SoundWave

class JournalController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

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
		label.text = "Sunday, September 19, 2022"
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
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    let microphoneButton = MicrophoneButtonView()

    var data: [String] = ["dog", "cow", "mouse", "dog", "cow", "mouse", "dog", "cow", "mouse"]

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
        microphoneButtonLongPress()
        addSubviews()
	}

    // MARK: - Functions

    func microphoneButtonLongPress() {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(presentRecordingController(_:)))
        microphoneButton.addGestureRecognizer(longPressRecognizer)
    }

    @objc func presentRecordingController(_ sender: UILongPressGestureRecognizer) {
        let recordingController = RecordingController()
        if sender.state == .began {

            recordingController.modalPresentationStyle = .overCurrentContext
            self.present(recordingController, animated: false)
        }
        else if sender.state == .ended {
            self.dismiss(animated: false)
        }
    }

    func addSubviews() {
        view.addSubview(headerContainer)
        headerContainer.addSubview(mainHeaderLabel)
        headerContainer.addSubview(dateHeaderLabel)

        view.addSubview(containerView)
        containerView.addSubview(collectionView)
        view.addSubview(microphoneButton)
        setupSubviews()
        addGradient()
        addBlurEffect(on: collectionView)
    }

    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.masksToBounds = true
        gradient.colors = [UIColor.clear.withAlphaComponent(0.3).cgColor, UIColor.clear.withAlphaComponent(1.0).cgColor]
        gradient.locations = [0, 0.05]
        containerView.layer.mask = gradient
    }

    func addBlurEffect(on view: UIView) {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.clipsToBounds = true
        blurEffectView.layer.cornerRadius = 26
        view.insertSubview(blurEffectView, at: 0)

        NSLayoutConstraint.activate([
            blurEffectView.topAnchor.constraint(equalTo: microphoneButton.topAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: microphoneButton.leadingAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: microphoneButton.bottomAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: microphoneButton.trailingAnchor),
        ])
    }

    func setupSubviews() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(JournalCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        NSLayoutConstraint.activate(
            [
                // Header
                headerContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                headerContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                headerContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                headerContainer.heightAnchor.constraint(equalToConstant: 120),
                
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
                collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                
                // Button View
                microphoneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                microphoneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                microphoneButton.widthAnchor.constraint(equalToConstant: 52),
                microphoneButton.heightAnchor.constraint(equalToConstant: 52),
            ]
        )
    }

	func selectedCell(row: Int) {
		print("Row: \(row)")
	}

    // MARK: - CollectionView Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }

    // MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! JournalCollectionViewCell
        return cell
    }
}

extension JournalController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.size.width - 16, height: 100)
    }
}
