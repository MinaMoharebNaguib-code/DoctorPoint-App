//
//  ReviewProCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 28/05/2022.
//

import UIKit

class ReviewProCollectionViewCell: UICollectionViewCell {
    var numberStar: Float = 4.5
    @IBOutlet weak var imageProfileReview: UIImageView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func roundingStar(_ number: Float)
    {
        let result = round(number)
        switch result
        {
        case 1:
            star1.isHidden = false
            star2.isHidden = true
            star3.isHidden = true
            star4.isHidden = true
            star5.isHidden = true
        case 2:
            star1.isHidden = false
            star2.isHidden = false
            star3.isHidden = true
            star4.isHidden = true
            star5.isHidden = true
        case 3:
            star1.isHidden = false
            star2.isHidden = false
            star3.isHidden = false
            star4.isHidden = true
            star5.isHidden = true
        case 4:
            star1.isHidden = false
            star2.isHidden = false
            star3.isHidden = false
            star4.isHidden = false
            star5.isHidden = true
        case 5:
            star1.isHidden = false
            star2.isHidden = false
            star3.isHidden = false
            star4.isHidden = false
            star5.isHidden = false
            
        default:
            star1.isHidden = true
            star2.isHidden = true
            star3.isHidden = true
            star4.isHidden = true
            star5.isHidden = true
        }
    }
}
