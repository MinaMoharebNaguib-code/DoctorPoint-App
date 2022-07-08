//
//  FavouriteDCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 26/05/2022.
//

import UIKit

class FavouriteDCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewMain: UIView!
    {
        didSet
        {
            viewMain.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            viewMain.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var imageDoctor: UIImageView!
    {
        didSet
        {
            imageDoctor.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var nameDoctor: UILabel!
    @IBOutlet weak var desDoctor: UILabel!
    @IBOutlet weak var unlikeButton: UIButton!
    {
        didSet
        {
            unlikeButton.backgroundColor = .white
            unlikeButton.layer.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1).cgColor
            unlikeButton.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMinYCorner]
            unlikeButton.layer.cornerRadius = 10
            unlikeButton.layer.masksToBounds = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
