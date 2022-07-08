//
//  NetCellCollectionViewCell.swift
//  customNo
//
//  Created by Mina Mohareb on 19/06/2022.
//

import UIKit

class NetCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var viewImage: UIView!
    {
        didSet
        {
            viewImage.backgroundColor = UIColor(red: 0.333, green: 0.329, blue: 0.859, alpha: 0.1)
            viewImage.layer.cornerRadius = 10
            viewImage.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelMsg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func type(_ typeNotification: TypeNotification)
    {
        if typeNotification == .Alarm
        {
            self.imageType.image = UIImage(named: "Alarm")
            self.viewImage.backgroundColor = UIColor(red: 1, green: 0.659, blue: 0.451, alpha: 0.1)
        }else
        {
            self.imageType.image = UIImage(named: "Notification")
            self.viewImage.backgroundColor = #colorLiteral(red: 0.9338436723, green: 0.9325729012, blue: 0.9849094748, alpha: 1)
        }
    }
}
