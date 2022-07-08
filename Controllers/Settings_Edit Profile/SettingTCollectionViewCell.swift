//
//  SettingTCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 15/05/2022.
//

import UIKit

class SettingTCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageShow: UIView!
    {
        didSet
        {
            imageShow.layer.cornerRadius = 15
            imageShow.backgroundColor = UIColor(red: 0.627, green: 0.475, blue: 0.925, alpha: 0.1)
        }
    }
    @IBOutlet weak var image: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //image.alpha = 1
    }

}
