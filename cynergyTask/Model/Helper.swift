//
//  Helper.swift
//  cynergyTask
//
//  Created by Mohammad Rishan Rashid on 22/01/24.
//

import UIKit


class Helper{
    static let baseURL: String = "https://cinergyapp.thetunagroup.com/api/guestToken"
    static let login: String = "https://cinergyapp.thetunagroup.com/api/login"
    static let escapeRoom: String = "https://cinergyapp.thetunagroup.com/api/escapeRoomMovies"
    static let getMovieInfo: String = "https://cinergyapp.thetunagroup.com/api/getMovieInfo"
}
extension UIView {
    func showActivityIndicator(activityIndicator: UIActivityIndicatorView, targetVC: UIViewController = UIViewController()) {
        activityIndicator.backgroundColor = UIColor(red:0.16, green:0.17, blue:0.21, alpha:1)
        activityIndicator.layer.cornerRadius = 6
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.color = .white
        activityIndicator.tag = 1
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
    }
    
    func hideActivityIndicator(activityIndicator: UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        self.isUserInteractionEnabled = true
    }
    
    func roundCorners(cornerRadius: CGFloat) {
        if #available(iOS 11.0, *){
            self.clipsToBounds = true
            self.layer.cornerRadius = cornerRadius
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }else{
            let path = UIBezierPath(roundedRect: self.bounds,byRoundingCorners:[.topLeft, .topRight],cornerRadii: CGSize(width: cornerRadius, height:  cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }

}
