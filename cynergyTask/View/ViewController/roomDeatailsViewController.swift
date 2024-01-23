//
//  roomDeatailsViewController.swift
//  cynergyTask
//
//  Created by Mohammad Rishan Rashid on 22/01/24.
//

import UIKit

class roomDeatailsViewController: UIViewController {
    var selectedMovieIndex = 0
    @IBOutlet weak var mainView:UIView!
    @IBOutlet weak var ContButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        mainView.roundCorners(cornerRadius: 20)
        ContButton.layer.cornerRadius = 20
        ContButton.clipsToBounds = true
        ContButton.backgroundColor = UIColor(red: 0.43, green: 0.62, blue: 0.19, alpha: 1.00)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func ContinueButtonTapped(_ sender: UIButton) {
        
        if let finalVc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "finalViewController") as? finalViewController {
            finalVc.hidesBottomBarWhenPushed = false
            finalVc.modalPresentationStyle = .fullScreen
            present(finalVc, animated: true, completion: nil)
        } else {
            print("Error: Unable to instantiate MainViewController")
        }
    }
}

