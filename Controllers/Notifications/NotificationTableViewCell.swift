//
//  NotificationTableViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 05/05/2022.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    enum TypeNotification{
        case Alarm, Notification
    }
    @IBOutlet weak var labelDes: UILabel!
    @IBOutlet weak var labelNotification: UILabel!
    @IBOutlet weak var viewType: UIView!
    {
        didSet
        {
            viewType.layer.borderWidth = 3
            viewType.layer.borderColor = UIColor.white.cgColor
            viewType.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var imageType: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func type(_ typeNotification: TypeNotification)
    {
        if typeNotification == .Alarm
        {
            self.imageType.image = UIImage(named: "Alarm")
            self.viewType.backgroundColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0.4509803922, alpha: 1)
        }else
        {
            self.imageType.image = UIImage(named: "Notification")
            self.viewType.backgroundColor = #colorLiteral(red: 0.9338436723, green: 0.9325729012, blue: 0.9849094748, alpha: 1)
        }
    }
}
