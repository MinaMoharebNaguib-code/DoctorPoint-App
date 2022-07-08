//
//  FilterDoctorCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 15/05/2022.
//

import UIKit

class FilterDoctorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    {
        didSet
        {
            backView.layer.borderWidth = 1
            backView.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
            backView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var filter: UILabel!
    override var isSelected: Bool{
        didSet
        {
            if isSelected{
                backView.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
                backView.layer.borderColor = UIColor(red: 0.667, green: 0.671, blue: 0.671, alpha: 0.2).cgColor
                filter.textColor = .white
            }else
            {
                backView.backgroundColor = .white
                backView.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
                filter.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
