//
//  FeesCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 23/05/2022.
//

import UIKit

class FeesCollectionViewCell: UICollectionViewCell {
    var price = 0
    @IBOutlet weak var viewMain: UIView!
    {
        didSet
        {
            viewMain.layer.cornerRadius = 10
            viewMain.layer.borderWidth = 1
            viewMain.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        }
    }
    @IBOutlet weak var viewImage: UIView!
    {
        didSet
        {
            viewImage.layer.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 0.8).cgColor
            viewImage.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var imageFee: UIImageView!
    @IBOutlet weak var titleFee: UILabel!
    @IBOutlet weak var desFee: UILabel!
    @IBOutlet weak var priceFee: UILabel!
    override var isSelected: Bool
    {
        didSet
        {
            if isSelected
            {
                if titleFee.text == "Voice call"
                {
                    viewMain.backgroundColor = UIColor(red: 0.333, green: 0.329, blue: 0.859, alpha: 1)
                    titleFee.textColor = .white
                    desFee.textColor = .white
                    priceFee.textColor = .white
                }else if titleFee.text == "Messaging"
                {
                    viewMain.backgroundColor = UIColor(red: 1, green: 0.659, blue: 0.451, alpha: 1)
                    titleFee.textColor = .white
                    desFee.textColor = .white
                    priceFee.textColor = .white
                }else
                {
                    viewMain.backgroundColor = UIColor(red: 0.627, green: 0.475, blue: 0.925, alpha: 1)
                    titleFee.textColor = .white
                    desFee.textColor = .white
                    priceFee.textColor = .white
                }

            }else
            {
                viewMain.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                titleFee.textColor = UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 1)
                desFee.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                priceFee.textColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func typeFee(typeF: TypeFee)
    {
        switch typeF
        {
        case .Voice:
            imageFee.image = UIImage(named: "Vo_Icon")
            titleFee.text = "Voice call"
            desFee.text = "Can make a voice call with doctor."
            priceFee.text = "$10"
        case .Messaging:
            imageFee.image = UIImage(named: "Me_Icon")
            titleFee.text = "Messaging"
            desFee.text = "Can messaging with doctor."
            priceFee.text = "$5"
        case .Video:
            imageFee.image = UIImage(named: "Vi_Icon")
            titleFee.text = "Video call"
            desFee.text = "Can make a video call with doctor."
            priceFee.text = "$20"
        }
    }
}
