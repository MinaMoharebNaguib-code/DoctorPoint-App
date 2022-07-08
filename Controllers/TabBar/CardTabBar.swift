//
//  CardTabBar.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 04/05/2022.
//

import UIKit

class CardTabBar: BaseCardTabBar {
    
    override var preferredTabBarHeight: CGFloat {
        80
    }
    
    override var preferredBottomBackground: UIColor {
        .clear
    }
    
    lazy var containerView: UIView = UIView()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        return stackView
    }()
    
    private var indicatorViewXConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    deinit {
        stackView.arrangedSubviews.forEach {
            if let button = $0 as? UIControl {
                button.removeTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
            }
        }
    }
    
    private func setup(){
        translatesAutoresizingMaskIntoConstraints = false
        
        subviewsPreparedAL {
            containerView
        }
        
        containerView.subviewsPreparedAL {
            stackView
        }
        
        containerView.pinToSuperView(top: 0, left: 24, bottom: -24, right: -24)
        stackView.pinToSuperView(top: 15, left: 15, bottom: -15, right: -15)
        stackView.centerInSuperView()

        updateStyle()
    }
    
    
    func updateStyle(){
        containerView.backgroundColor = .white
    }
    
    
    override func set(items: [UITabBarItem]) {
        for button in (stackView.arrangedSubviews.compactMap { $0 as? PTBarButton }) {
            stackView.removeArrangedSubview(button)
            button.removeFromSuperview()
            button.removeTarget(self, action: nil, for: .touchUpInside)
        }
        
        for i in 0..<items.count
        {
            if let image = items[i].image
            {
                if let selectedImage = items[i].selectedImage
                {
                    addButton(with: image, with: selectedImage)
                }else
                {
                    addButton(with: image, with: UIImage())
                }
            }else
            {
                addButton(with: UIImage(), with: UIImage())
            }
        }
        
        layoutIfNeeded()
    }
    
    override func select(at index: Int, animated: Bool, notifyDelegate: Bool) {
        /* move the indicator view */
        if indicatorViewXConstraint != nil {
            indicatorViewXConstraint.isActive = false
            indicatorViewXConstraint = nil
        }
        
        for (bIndex, button) in buttons().enumerated() {
            button.isSelected = bIndex == index
        }
        
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
        
        
        if notifyDelegate {
            self.delegate?.cardTabBar(self, didSelectItemAt: index)
        }
    }
    
    private func addButton(with image: UIImage, with selectedImage: UIImage){
        let button = PTBarButton(image: image, selectedImage: selectedImage)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        self.stackView.addArrangedSubview(button)
    }
    
    private func buttons() -> [PTBarButton] {
        return stackView.arrangedSubviews.compactMap { $0 as? PTBarButton }
    }
    
    
    @objc func buttonTapped(sender: PTBarButton){
        if let index = stackView.arrangedSubviews.firstIndex(of: sender){
            select(at: index, animated: true, notifyDelegate: true)
        }
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let position = touches.first?.location(in: self) else {
            super.touchesEnded(touches, with: event)
            return
        }
        
        let buttons = self.stackView.arrangedSubviews.compactMap { $0 as? PTBarButton }.filter { !$0.isHidden }
        let distances = buttons.map { $0.center.distance(to: position) }
        
        let buttonsDistances = zip(buttons, distances)
        
        if let closestButton = buttonsDistances.min(by: { $0.1 < $1.1 }) {
            buttonTapped(sender: closestButton.0)
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
    }
}

extension CardTabBar {
    open class PTIndicatorView: UIView {
        override open func layoutSubviews() {
            super.layoutSubviews()
        }
    }
    
    public class HoverView: UIView{
        
        init(button: PTBarButton){
            super.init(frame: .zero)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
            self.addSubview(button)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
    public class PTBarButton: UIButton {
        
        let image: UIImage?
        let selectedImage: UIImage?
        
        init(image: UIImage?, selectedImage: UIImage?){
            self.image = image
            self.selectedImage = selectedImage
            super.init(frame: .zero)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        override public var isSelected: Bool {
            didSet {
                reloadApperance()
            }
        }
        
        func reloadApperance(){
            self.layer.cornerRadius = 10
            self.setImage(isSelected ? selectedImage : image, for: .normal)
            self.backgroundColor = isSelected ? #colorLiteral(red: 0.9058823529, green: 0.9607843137, blue: 0.9490196078, alpha: 1) : .clear
        }
        override var intrinsicContentSize: CGSize {
            .init(width: 55, height: 50)
        }
    }

}
