//
//  BaseCardTabBar.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 04/05/2022.
//

import UIKit

protocol CardTabBarDelegate: AnyObject {
    func cardTabBar(_ sender: BaseCardTabBar, didSelectItemAt index: Int)
    
    func didUpdateHeight()
}

class BaseCardTabBar: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var preferredTabBarHeight: CGFloat {
        80
    }
    
    var preferredBottomBackground: UIColor {
        .clear
    }
    
    weak var delegate: CardTabBarDelegate?
    
    func select(at index: Int, animated: Bool, notifyDelegate: Bool) {
        
    }
    
    func set(items: [UITabBarItem]) {
        
    }

}
