//
//  TopDoctorsCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 11/05/2022.
//

import UIKit

class TopDoctorsCollectionViewCell: UICollectionViewCell {
    var contentVC = UIViewController()
    @IBOutlet weak var viewAll: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    func setup()
    {
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: "DoctorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DoctorCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
}
extension TopDoctorsCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DoctorCollectionViewCell", for: indexPath) as! DoctorCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 130, height: 188)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    
}
