//
//  ItemDetailsViewController.swift
//  Burger King App
//
//  Created by Rachit Prajapati on 22/03/21.
//

import UIKit

extension UIImageView {
    static func createItems(width: CGFloat, height: CGFloat, imageName: String) -> UIImageView {
        let iv = UIImageView()
        iv.contentMode  = .scaleAspectFill
        iv.image = UIImage(named: imageName)
        iv.setDimensions(width: width, height: height)
        return iv
    }
}

extension UILabel {
    static func createItemName(color: UIColor, size: CGFloat, text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor =  color
        label.font = UIFont(name: "InsaniburgerwithCheese", size: size)
        return label
    }
}

class ItemDetailsViewController: UIViewController {
    
    // MARK: - Properties
    

    private var panGesture = UIPanGestureRecognizer()
     
    var item: Menu? {
        didSet {
            guard let item = item else { return }
            callOut(item: item)
        }
    }
    
   
    
    private let burger: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "burger1")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.widthAnchor.constraint(equalToConstant: 250).isActive = true
        label.textColor = .white
        label.text = "xssxs"
        label.font = UIFont(name: "InsaniburgerwithCheese", size: 35)
        return label
    }()
    
    private let checkOut: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 35/255, green: 35/255, blue: 32/255, alpha: 1.0)
        button.setTitle("Checkout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setDimensions(width: 100, height: 50)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(presentAnimation), for: .touchUpInside)
        return button
    }()
    
    private let addToCart: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Add to cart", for: .normal)
        button.setTitleColor(UIColor(red: 35/255, green: 35/255, blue: 32/255, alpha: 1.0), for: .normal)
        button.setDimensions(width: 120, height: 50)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor(red: 35/255, green: 35/255, blue: 32/255, alpha: 1.0).cgColor
        button.addTarget(self, action: #selector(pullBack), for: .touchUpInside)
        return button
    }()
    
    private let orderStatus: UILabel = {
        let label = UILabel()
        label.text = "Ready in 30 minutes"
        label.font = UIFont(name: "ArialRoundedMTBold", size: 20)
        label.textColor = .black
        return label
    }()
    
    private let drinks: UIImageView = {
        let iv = UIImageView.createItems(width: 60, height: 120, imageName: "drinks")
        return iv
    }()
    private let aboutDrink: UILabel = {
        let label = UILabel.createItemName(color: .black, size: 15, text: "Hot beverages")
       return label
    }()
    
    private let fries: UIImageView = {
        let iv = UIImageView.createItems(width: 60, height: 120, imageName: "fries")
        return iv
    }()
    
    private let aboutFries: UILabel = {
        let label = UILabel.createItemName(color: .black, size: 15, text: "Saucy fries")
       return label
    }()
    
    private let rings: UIImageView = {
        let iv = UIImageView.createItems(width: 60, height: 70, imageName: "rings")
        return iv
    }()
    
    
    private let aboutRings: UILabel = {
        let label = UILabel.createItemName(color: .black, size: 15, text: "Juicy rings")
       return label
    }()
    
    
    
    
    private let star1: UIImageView  = {
        let iv = UIImageView.createItems(width: 30, height: 30, imageName: "full")
        return iv
    }()
    
    
    private let star2: UIImageView  = {
        let iv = UIImageView.createItems(width: 30, height: 30, imageName: "full")
        return iv
    }()
    
    private let star3: UIImageView  = {
        let iv = UIImageView.createItems(width: 30, height: 30, imageName: "full")
        return iv
    }()
    private let star4: UIImageView  = {
        let iv = UIImageView.createItems(width: 30, height: 30, imageName: "full")
        return iv
    }()
    
    
    private let star5: UIImageView  = {
        let iv = UIImageView.createItems(width: 30, height: 30, imageName: "half")
        return iv
    }()
    
    private let rating: UILabel = {
        let label = UILabel.createItemName(color: .black, size: 50, text: "4.5")
       return label
    }()
    
    private let ratingsinfo: UILabel = {
        let label = UILabel.createItemName(color: .black, size: 20, text: "View all 444 ratings")
       return label
    }()
    
    
    
    private lazy var cardView: UIView = {
        let dView = UIView()
        dView.backgroundColor = .white
        dView.layer.cornerRadius = 50
       
        dView.layer.shadowColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1.0)
        dView.layer.shadowRadius = 7
        dView.layer.shadowOpacity = 0.9
        dView.layer.shadowOffset  = CGSize(width: 0, height: -10)
        dView.addSubview(checkOut)
        checkOut.centerX(inView: dView)
        checkOut.anchor( bottom: dView.bottomAnchor, paddingBottom: 170)
        dView.addSubview(addToCart)
        addToCart.centerX(inView: dView)
        addToCart.anchor( bottom: dView.bottomAnchor, paddingBottom: 110)
        
        dView.addSubview(orderStatus)
        orderStatus.centerX(inView: dView)
        orderStatus.anchor(bottom: checkOut.topAnchor, paddingBottom: 30)
        
        dView.addSubview(drinks)
        drinks.anchor(left: dView.leftAnchor, bottom: orderStatus.topAnchor, paddingLeft: 40, paddingBottom: 80)
        dView.addSubview(aboutDrink)
        aboutDrink.anchor(top: drinks.bottomAnchor, left: dView.leftAnchor, paddingTop: 10, paddingLeft: 10)
        
        
        dView.addSubview(rings)
        rings.centerX(inView: dView)
        rings.anchor(bottom: orderStatus.topAnchor, paddingBottom: 80)
        dView.addSubview(aboutRings)
        aboutRings.centerX(inView: dView)
        aboutRings.anchor(top: rings.bottomAnchor,  paddingTop: 10)
        
        dView.addSubview(fries)
        fries.anchor( bottom: orderStatus.topAnchor, right: dView.rightAnchor ,paddingBottom: 80, paddingRight: 20)
        dView.addSubview(aboutFries)
        aboutFries.anchor(top: fries.bottomAnchor, right: dView.rightAnchor, paddingTop: 10, paddingRight: 10)
        
        dView.addSubview(star1)
        star1.anchor(top: dView.topAnchor, left: dView.leftAnchor, paddingTop: 40, paddingLeft: 20)
        dView.addSubview(star2)
        star2.anchor(top: dView.topAnchor, left: star1.rightAnchor, paddingTop: 40, paddingLeft: 5)
        dView.addSubview(star3)
        star3.anchor(top: dView.topAnchor, left: star2.rightAnchor, paddingTop: 40, paddingLeft: 5)
        dView.addSubview(star4)
        star4.anchor(top: dView.topAnchor, left: star3.rightAnchor, paddingTop: 40, paddingLeft: 5)
        dView.addSubview(star5)
        star5.anchor(top: dView.topAnchor, left: star4.rightAnchor, paddingTop: 40, paddingLeft: 5)
        dView.addSubview(rating)
        rating.anchor(top: dView.topAnchor, left: star5.rightAnchor, paddingTop: 25, paddingLeft: 10)
        dView.addSubview(ratingsinfo)
        ratingsinfo.anchor(top: rating.bottomAnchor, left: dView.leftAnchor, paddingTop: 10, paddingLeft: 20)
        
        
        return dView
    }()
    
    
    private let price: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.text = "$\(7.5)"
        label.font = UIFont(name: "InsaniburgerwithCheese", size: 45)
        return label
    }()
    
    
    

    
    
    // MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        animateDescriptionView()
        animateContents()
        
    }
    
    
    // MARK: - Selectors
    
    @objc func presentAnimation() {
        let nav = BurgerController()
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
        
    }
    
    @objc func draggedView(_ sender: UIPanGestureRecognizer) {

    self.view.bringSubviewToFront(cardView)
    let translation = sender.translation(in: self.view)
    
    if translation.y > 0.0 {
        cardView.center = CGPoint(x: cardView.center.x, y: cardView.center.y +  translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
        self.navigationController?.popViewController(animated: true)
        
    }
}

    
    @objc func pullBack() {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - API
    
    func animateTransform(content: UIView, delay: Double) {
        let anim = CASpringAnimation(keyPath: "transform.scale")
        anim.fromValue = 0.0
        anim.toValue = 1.0
        anim.damping = 2.5
        anim.beginTime = CACurrentMediaTime() + delay
        anim.duration = anim.settlingDuration
        content.layer.add(anim, forKey: nil)
    }
    
 
    
    
    
    func animateContents() {
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: [.curveEaseInOut]) {
            self.burger.transform = self.burger.transform.scaledBy(x: 0.5, y: 2.0)
            self.burger.alpha = 1
            self.burger.center.y -= 150
        }
        UIView.animate(withDuration: 2.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [.curveEaseInOut]) {
            self.burger.transform = CGAffineTransform.identity
        }
        
        let desiredPosition0 = name.layer.position.x - 100
        let desiredPosition1 = name.layer.position.x + 200
        let presentName = CAKeyframeAnimation(keyPath: "position.x")
        presentName.values = [desiredPosition0, desiredPosition1, name.layer.position.x]
        presentName.keyTimes = [0.0, 0.7, 1.5]
        presentName.beginTime = CACurrentMediaTime() + 0.5
        presentName.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        presentName.fillMode = CAMediaTimingFillMode.both
        presentName.duration = 0.5
        name.layer.add(presentName, forKey: nil)
        
        let desiredPositio0 = price.layer.position.x - 100
        let desiredPositio1 = price.layer.position.x + 40
        let presentPrice = CAKeyframeAnimation(keyPath: "position.x")
        presentPrice.values = [desiredPositio0, desiredPositio1, price.layer.position.x]
        presentPrice.keyTimes = [0.0, 0.25, 0.5]
        presentPrice.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        presentPrice.fillMode = CAMediaTimingFillMode.both
        presentPrice.duration = 0.5
        presentPrice.beginTime = CACurrentMediaTime() + 0.5
        price.layer.add(presentPrice, forKey: nil)
        
        animateTransform(content: star1, delay: 0.0)
        animateTransform(content: star2, delay: 0.1)
        animateTransform(content: star3, delay: 0.2)
        animateTransform(content: star4, delay: 0.3)
        animateTransform(content: star5, delay: 0.4)
        animateTransform(content: rating, delay: 0.5)
        animateTransform(content: ratingsinfo, delay: 0.0)
        animateTransform(content: drinks, delay: 0.0)
        animateTransform(content: rings, delay: 0.0)
        animateTransform(content: fries, delay: 0.0)
        animateTransform(content: aboutDrink, delay: 0.0)
        animateTransform(content: aboutRings, delay: 0.0)
        animateTransform(content: aboutFries, delay: 0.0)
        
        animateTransform(content: orderStatus, delay: 0.0)
        animateTransform(content: checkOut, delay: 0.0)
        animateTransform(content: addToCart, delay: 0.0)
    }
    
    
    func animateDescriptionView() {
        UIView.animate(withDuration: 0.5, delay: 0.0,
          options: [.curveEaseInOut],
          animations: {
            self.cardView.center.y -= 500
          })
        
        UIView.animate(withDuration: 0.5) {
            self.cardView.center.y -= 500
        } completion: { (_) in
            UIView.animate(withDuration: 0.25) {
                self.cardView.center.y += 70
            } completion: { (_) in
                UIView.animate(withDuration: 0.25) {
                    self.cardView.center.y -= 70
                }
            }
        }

    }
    
    // MARK: - Helpers
    
    private func callOut(item: Menu) {
        burger.image = item.itemImage
        price.text = "$\(item.price)"
        name.text = item.name
        view.backgroundColor = item.backgroundColor
    }
    
    private func setupUI() {
        view.addSubview(burger)
        burger.alpha = 0
        burger.setDimensions(width: 160, height: 180)
        burger.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, paddingTop: 30, paddingRight: -20)
        
        view.addSubview(name)
        name.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 40, paddingLeft: 20)
        
        view.addSubview(cardView)
        cardView.setDimensions(width: view.frame.width, height: view.frame.height - 150)
        cardView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: -80)
        
        view.addSubview(price)
        price.anchor(left: view.leftAnchor, bottom: cardView.topAnchor, paddingLeft: 20, paddingBottom: 10)
        
        panGesture  = UIPanGestureRecognizer(target: self, action: #selector(draggedView(_:)))
        cardView.isUserInteractionEnabled = true
        cardView.addGestureRecognizer(panGesture)

        
    }

}
