//
//  NotificationCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 22/05/2022.
//

import UIKit

class NotificationCollectionViewCell: UICollectionViewCell {

    enum TypeNotification{
        case Alarm, Notification
    }
    @IBOutlet weak var viewImage: UIView!
    {
        didSet
        {
            viewImage.layer.borderWidth = 3
            viewImage.layer.borderColor = UIColor.white.cgColor
            viewImage.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var titleType: UILabel!
    @IBOutlet weak var lableType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func type(_ typeNotification: TypeNotification)
    {
        if typeNotification == .Alarm
        {
            self.imageType.image = UIImage(named: "Alarm")
            self.viewImage.backgroundColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0.4509803922, alpha: 1)
        }else
        {
            self.imageType.image = UIImage(named: "Notification")
            self.viewImage.backgroundColor = #colorLiteral(red: 0.9338436723, green: 0.9325729012, blue: 0.9849094748, alpha: 1)
        }
    }
}
