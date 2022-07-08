//
//  SecNovCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 22/05/2022.
//

import UIKit

class SecNovCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    {
        didSet
        {
            view.backgroundColor = .white
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.15).cgColor
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
