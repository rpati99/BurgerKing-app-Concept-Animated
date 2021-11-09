//
//  ViewController.swift
//  Burger King App
//
//  Created by Rachit Prajapati on 21/03/21.
//

import UIKit

class MenuController: UIViewController, UICollectionViewDelegate {
    
     //MARK: - Data
    
    let items: [Menu] = [
        Menu(name: "texas double whopper", price: 11.5, itemImage: UIImage(named: "burger6")!, backgroundColor:  UIColor(red: 71/255, green: 94/255, blue: 46/255, alpha: 1.0)),
        Menu(name: "BBQ crispy chicken", price: 7.5, itemImage: UIImage(named: "burger2")!,
             backgroundColor:   UIColor(red: 174/255, green: 72/255, blue: 50/255, alpha: 1.0)),
        Menu(name: "double whopper", price: 8.5, itemImage: UIImage(named: "burger3")!,
             backgroundColor:  UIColor(red: 92/255, green: 62/255, blue: 46/255, alpha: 1.0)),
        Menu(name: "cheese whopper", price: 7.5, itemImage: UIImage(named: "burger4")!,
             backgroundColor:    UIColor(red: 208/255, green: 187/255, blue: 160/255, alpha: 1.0)),
        Menu(name: "bbq bacon king", price: 7.5, itemImage: UIImage(named: "burger5")!,
             backgroundColor:   UIColor(red: 71/255, green: 94/255, blue: 46/255, alpha: 1.0)),
        Menu(name: "BBQ bacon whopper", price: 7.5, itemImage: UIImage(named: "burger1")!,
             backgroundColor:   UIColor(red: 174/255, green: 72/255, blue: 50/255, alpha: 1.0)),
        Menu(name: "swiss king", price: 12.5, itemImage: UIImage(named: "burger7")!,
             backgroundColor:   UIColor(red: 92/255, green: 62/255, blue: 46/255, alpha: 1.0)),
        Menu(name: "double cheeseburger", price: 7.5, itemImage: UIImage(named: "burger8")!,
             backgroundColor:  UIColor(red: 208/255, green: 187/255, blue: 160/255, alpha: 1.0))
        
    ]
    
    //MARK: - Properties
    
    var currentCell: UICollectionViewCell!
    var maskLayer: CAShapeLayer!
    var path: UIBezierPath!
    var isScrolling: Bool!
    var lastContentOffset: CGFloat = 0
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(menuCell.self, forCellWithReuseIdentifier: Constants.menuCellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    
     //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        animateCollectionView()
    }
    
    
     //MARK: - Helpers
    private func animateCollectionView() {
        UIView.animate(withDuration: 1.25, delay: 0.1,
          options: [.curveEaseInOut],
          animations: { [self] in
                collectionView.center.y -= 400
          })
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 35/255, green: 35/255, blue: 32/255, alpha: 1.0)
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(red: 35/255, green: 35/255, blue: 32/255, alpha: 1.0)
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.center.y += 400
    }


}


