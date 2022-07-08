//
//  InviteCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 01/06/2022.
//

import UIKit

class InviteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageInvite: UIImageView!
    {
        didSet
        {
            imageInvite.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var nameInvite: UILabel!
    @IBOutlet weak var inviteButton: UIButton!
    {
        didSet
        {
            inviteButton.layer.backgroundColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.1).cgColor
            inviteButton.layer.cornerRadius = 10
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
