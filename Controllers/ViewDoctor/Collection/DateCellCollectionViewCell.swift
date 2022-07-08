//
//  DateCellCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 22/05/2022.
//

import UIKit

class DateCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    {
        didSet
        {
            backView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            backView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var dateNumber: UILabel!
    
    override var isSelected: Bool
    {
        didSet
        {
            if isSelected{
                backView.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
                dateTitle.textColor = UIColor.white
                dateNumber.textColor = UIColor.white
            }else
            {
                backView.backgroundColor = UIColor.white
                dateTitle.textColor = UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 0.3)
                dateNumber.textColor = UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 1)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
