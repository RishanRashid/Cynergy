//
//  escapeCollectionViewCell.swift
//  cynergyTask
//
//  Created by Mohammad Rishan Rashid on 22/01/24.
//

import UIKit

class escapeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var escapeLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
        

    }

}
