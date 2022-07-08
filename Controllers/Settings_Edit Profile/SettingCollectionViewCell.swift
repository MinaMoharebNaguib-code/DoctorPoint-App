//
//  SettingCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 15/05/2022.
//

import UIKit

class SettingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageShow: UIView!{
        didSet
        {
            imageShow.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var language: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        language.isHidden = true
    }
    func type(_ typeSetting: TypeSetting)
    {
        switch typeSetting {
        case .Pro:
            imageShow.backgroundColor = UIColor(red: 1, green: 0.659, blue: 0.451, alpha: 0.1)
            image.image = UIImage(named: "Pro Member_Icon")
            name.text = "Become a pro member"
            language.isHidden = true
        case .Language:
            imageShow.backgroundColor = UIColor(red: 1, green: 0.659, blue: 0.451, alpha: 0.1)
            image.image = UIImage(named: "Language_Icon")
            name.text = "Language"
            language.isHidden = false
        case .Invite:
            imageShow.backgroundColor = UIColor(red: 0.333, green: 0.329, blue: 0.859, alpha: 0.1)
            image.image = UIImage(named: "Profile_Icon")
            name.text = "Invite a freind"
            language.isHidden = true
        case .Favourite:
            imageShow.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 0.1)
            image.image = UIImage(named: "Vector_Icon")
            name.text = "Favourite doctors"
            language.isHidden = true
        case .FAQs:
            imageShow.backgroundColor = UIColor(red: 0.333, green: 0.329, blue: 0.859, alpha: 0.1)
            image.image = UIImage(named: "FAQs_Icon")
            name.text = "FAQs"
            language.isHidden = true
        case .Help:
            imageShow.backgroundColor = UIColor(red: 0.627, green: 0.475, blue: 0.925, alpha: 0.1)
            image.image = UIImage(named: "Help_Icon")
            name.text = "Help"
            language.isHidden = true
        case .N:
            print("OK")
        }
    }
}
