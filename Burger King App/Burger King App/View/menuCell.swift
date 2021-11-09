//
//  menuCell.swift
//  Burger King App
//
//  Created by Rachit Prajapati on 21/03/21.
//

import UIKit

class menuCell: UICollectionViewCell {

    var menu: Menu? {
        didSet {
            guard let menu = menu else { return }
            burgerName.text = menu.name
            burger.image = menu.itemImage
            price.text = "$\(menu.price)"
        }
       
    }
    
    private let burgerName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.widthAnchor.constraint(equalToConstant: 250).isActive = true
        label.textColor = .white
        label.font = UIFont(name: "InsaniburgerwithCheese", size: 35)
        return label
    }()
    
    private let price: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.font = UIFont(name: "InsaniburgerwithCheese", size: 30)
        return label
    }()

    private let newLabel: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "new")
        iv.contentMode = .scaleAspectFill
        iv.setDimensions(width: 100, height: 40)
        return iv
    }()
    
    private let  burger: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "burger1")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - API
    
    private func setupCellUI() {
        contentView.addSubview(burger)
      
        burger.center.y += 120
        burger.setDimensions(width: 160, height: frame.height - 15)
        burger.anchor(bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingBottom: -10, paddingRight: -10)
        contentView.addSubview(burgerName)
        burgerName.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, paddingTop: 10, paddingLeft: 20)
        
        contentView.addSubview(price)
        price.anchor(left: contentView.leftAnchor, bottom: contentView.bottomAnchor, paddingLeft: 20, paddingBottom: 5)
        
    }
    
    func presentContents() {
        let presentBurger = CASpringAnimation(keyPath: "transform.scale")
        presentBurger.fromValue = 0.0
        presentBurger.toValue = 1.0
        presentBurger.damping = 2.5
        presentBurger.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        presentBurger.duration = presentBurger.settlingDuration
        presentBurger.isRemovedOnCompletion = true
        burger.layer.add(presentBurger, forKey: nil)
        
        let desiredPosition0 = burgerName.layer.position.x - 100
        let desiredPosition1 = burgerName.layer.position.x + 200
        let presentName = CAKeyframeAnimation(keyPath: "position.x")
        presentName.values = [desiredPosition0, desiredPosition1, burgerName.layer.position.x]
        presentName.keyTimes = [0.0, 0.6, 1.2]
        presentName.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        presentName.fillMode = CAMediaTimingFillMode.both
       
        presentName.duration = 1.2
        burgerName.layer.add(presentName, forKey: nil)
        
        let desiredPositio0 = burgerName.layer.position.x - 100
        let desiredPositio1 = burgerName.layer.position.x + 40
        let presentPrice = CAKeyframeAnimation(keyPath: "position.x")
        presentPrice.values = [desiredPositio0, desiredPositio1, burgerName.layer.position.x]
        presentPrice.keyTimes = [0.0, 0.7, 1.5]
        presentPrice.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        presentPrice.fillMode = CAMediaTimingFillMode.both
        presentPrice.duration = 1.5
        price.layer.add(presentPrice, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.burgerName.layer.removeAllAnimations()
            self.price.layer.removeAllAnimations()
        }
    }

    func bounceBurger(y: CGFloat) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseInOut]) {
            self.burger.transform = self.burger.transform.scaledBy(x: 0.6, y: 1.5).translatedBy(x: 0.0, y: y)
        }
  
    }
    
    func bringBackBurger() {
        UIView.animate(withDuration: 2.0, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [.curveEaseInOut]) {
            self.burger.transform = CGAffineTransform.identity
        }
    }
    
    func removeAnimations() {
        burgerName.layer.removeAllAnimations()
        price.layer.removeAllAnimations()
    }
}
