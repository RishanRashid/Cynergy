//
//  finalViewController.swift
//  cynergyTask
//
//  Created by Mohammad Rishan Rashid on 23/01/24.
//

import UIKit
class finalViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var ContButton: UIButton!
    @IBOutlet weak var dateCollCEll: UICollectionView!
    @IBOutlet weak var dayCollCEll: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        ContButton.layer.cornerRadius = 20
        ContButton.clipsToBounds = true
        ContButton.backgroundColor = UIColor(red: 0.43, green: 0.62, blue: 0.19, alpha: 1.00)
    }
    
    func setupCollectionView() {
        dateCollCEll.dataSource = self
        dateCollCEll.delegate = self
        dateCollCEll.register(UINib(nibName: "DateCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DateCollectionViewCell")
        
        dayCollCEll.dataSource = self
        dayCollCEll.delegate = self
        dayCollCEll.register(UINib(nibName: "dayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "dayCollectionViewCell")
        let dateFlowLayout = UICollectionViewFlowLayout()
        dateFlowLayout.scrollDirection = .horizontal
        dateCollCEll.collectionViewLayout = dateFlowLayout
        let dayFlowLayout = UICollectionViewFlowLayout()
        dayFlowLayout.scrollDirection = .horizontal
        dayCollCEll.collectionViewLayout = dayFlowLayout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == dateCollCEll {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCollectionViewCell", for: indexPath) as! DateCollectionViewCell
            cell.Date.text = "\(indexPath.item + 1)"
            let day = calculateDay(for: indexPath.item)
            cell.Day.text = day
            return cell
        } else if collectionView == dayCollCEll {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCollectionViewCell", for: indexPath) as! dayCollectionViewCell
            cell.layer.borderColor = UIColor.green.cgColor
                    cell.layer.borderWidth = 1.0
            cell.layer.cornerRadius = 10
            cell.clipsToBounds = true
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.bounds.height)
    }
    
    private func calculateDay(for index: Int) -> String {
        return "Mon"
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "escapeRoomNavigationViewController") as? escapeRoomNavigationViewController {
            vc.hidesBottomBarWhenPushed = false
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            print("Error")
        }
    }
}
