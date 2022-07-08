//
//  DoctorCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 11/05/2022.
//

import UIKit

class DoctorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewDoctor: UIView!
    {
        didSet
        {
            viewDoctor.layer.cornerRadius = 15
            viewDoctor.layer.borderWidth = 1
            viewDoctor.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        }
    }
    @IBOutlet weak var imageDoctor: UIImageView!
    {
        didSet
        {
            imageDoctor.layer.cornerRadius = 25
        }
    }
    @IBOutlet weak var nameDoctor: UILabel!
    @IBOutlet weak var DesDoctor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
