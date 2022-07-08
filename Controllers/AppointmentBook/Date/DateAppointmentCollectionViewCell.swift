//
//  DateAppointmentCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 23/05/2022.
//

import UIKit

class DateAppointmentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewDate: UIView!
    {
        didSet
        {
            viewDate.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            viewDate.layer.cornerRadius = 10
            viewDate.layer.borderWidth = 1
            viewDate.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        }
    }
    @IBOutlet weak var dateLabel: UILabel!
    override var isSelected: Bool
    {
        didSet
        {
            if isSelected
            {
                viewDate.layer.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1).cgColor
                viewDate.layer.cornerRadius = 10
                viewDate.layer.borderWidth = 1
                viewDate.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
                dateLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            }else
            {
                viewDate.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
                viewDate.layer.cornerRadius = 10
                viewDate.layer.borderWidth = 1
                viewDate.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
                dateLabel.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
