//
//  CustomMemberLayout.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 29/05/2022.
//

import UIKit

class CustomMemberLayout: UICollectionViewFlowLayout {
    var previousOffset: CGFloat = 0.0
    var currentPage = 0
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let v = collectionView else
        {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let itemCount = v.numberOfItems(inSection: 0)
        
        if previousOffset > v.contentOffset.x && velocity.x < 0.0
        {
            currentPage = max(currentPage-1, 0)
        }else if previousOffset < v.contentOffset.x && velocity.x > 0.0
        {
            currentPage = min(currentPage+1,itemCount-1)
        }
        let offset = updateOffset(v)
        
        previousOffset = offset
        return CGPoint(x: offset, y: proposedContentOffset.y)
    }
    func updateOffset(_ v:UICollectionView) -> CGFloat
    {
        let w = v.frame.width
        let itemW = itemSize.width
        let sp = minimumLineSpacing
        let edge = (w - itemW - sp*2) / 2
        let offset = (itemW + sp) * CGFloat(currentPage) - (edge + sp)
        return offset
    }
}
