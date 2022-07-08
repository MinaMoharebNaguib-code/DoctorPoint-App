//
//  BannerCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 11/05/2022.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBanner: UIView!
    {
        didSet
        {
            viewBanner.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var viewPrice: UIView!
    {
        didSet
        {
            viewPrice.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
            viewPrice.layer.cornerRadius = 5
            viewPrice.clipsToBounds = true
        }
    }
    @IBOutlet weak var priceLBL: UILabel!
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var desLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLBL.text = "Cardio Issues?"
        desLBL.text = "For cardio patient here can easily\ncontact with doctor. Can chat & live\nchat."
        
    }

}
