//
//  escapeRoomNavigationViewController.swift
//  cynergyTask
//
//  Created by Mohammad Rishan Rashid on 22/01/24.
//

import UIKit

class escapeRoomNavigationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    let movieTitles = [
        "Inception",
        "The Shawshank Redemption",
        "The Dark Knight",
        "Pulp Fiction",
        "Forrest Gump",
        "The Godfather",
        "The Matrix",
        "Schindler's List",
        "The Silence of the Lambs",
        "Titanic"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    @IBAction func escapeRoomNavigation(_ sender: UIButton) {
        navigateToMainViewController()
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieTitles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "escapeCollectionViewCell", for: indexPath) as! escapeCollectionViewCell
        cell.escapeLabel.text = movieTitles[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let mainVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "roomDeatailsViewController") as? roomDeatailsViewController {
            mainVC.hidesBottomBarWhenPushed = false
            mainVC.modalPresentationStyle = .fullScreen
            mainVC.selectedMovieIndex = indexPath.row
            present(mainVC, animated: true, completion: nil)
        } else {
            print("Error: Unable to instantiate MainViewController")
        }    }


    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isUserInteractionEnabled = true
        collectionView.register(UINib(nibName: "escapeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "escapeCollectionViewCell")
        collectionView.reloadData()
    }
    private func navigateToMainViewController() {
        if let mainVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            mainVC.hidesBottomBarWhenPushed = false
            mainVC.modalPresentationStyle = .fullScreen
            present(mainVC, animated: true, completion: nil)
        } else {
            print("Error: Unable to instantiate MainViewController")
        }
    }

}
