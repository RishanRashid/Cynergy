//
//  ViewController.swift
//  cynergyTask
//
//  Created by Mohammad Rishan Rashid on 22/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    var activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    lazy var MainViewModel :mainViewModel = {
        return mainViewModel()
    }()
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var GuestButton: UIButton!
    @IBOutlet weak var stariCon: UIImageView!
    @IBOutlet weak var stariCon1: UIImageView!
    @IBOutlet weak var stariCon2: UIImageView!
    @IBOutlet weak var stariCon3: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      let authToken = getAuthToken()
        signInButton.backgroundColor = UIColor(red: 0.43, green: 0.62, blue: 0.19, alpha: 1.00)
        signUpButton.backgroundColor = UIColor(red: 0.43, green: 0.62, blue: 0.19, alpha: 1.00)
        GuestButton.backgroundColor = UIColor(red: 0.43, green: 0.62, blue: 0.19, alpha: 1.00)
        signInButton.layer.cornerRadius = 5
        signInButton.clipsToBounds = true
        signUpButton.layer.cornerRadius = 5
        signUpButton.clipsToBounds = true
        GuestButton.layer.cornerRadius = 5
        GuestButton.clipsToBounds = true
        stariCon1.tintColor = UIColor(red: 0.43, green: 0.62, blue: 0.19, alpha: 1.00)
        stariCon2.tintColor = UIColor(red: 0.43, green: 0.62, blue: 0.19, alpha: 1.00)
        stariCon3.tintColor = UIColor(red: 0.43, green: 0.62, blue: 0.19, alpha: 1.00)
        stariCon.tintColor = UIColor(red: 0.43, green: 0.62, blue: 0.19, alpha: 1.00)

//        escapeLogin()
    }
    
    @IBAction func escapeRoomNavigation(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "escapeRoomNavigationViewController") as? escapeRoomNavigationViewController {
            vc.hidesBottomBarWhenPushed = false
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            print("Error")
        }
    }
    
    
    func escapeLogin() {
        MainViewModel.loginViewModel(url: Helper.login) { result in
            switch result {
            case .success(let member_id):
                print("Received member_id \(member_id)")
                UserDefault.shared.setMemberId(memberId: member_id)

            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    
    
    func getAuthToken() {
        MainViewModel.getAuthToken(url: Helper.baseURL) { result in
            switch result {
            case .success(let token):
                print("Received token \(token)")
                UserDefault.shared.setAccessToken(accessToken: token)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
