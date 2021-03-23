//
//  ViewController.swift
//  Burger King App
//
//  Created by Rachit Prajapati on 21/03/21.
//

import UIKit

let menuCellID = "menuCellID"

class ViewController: UIViewController, UICollectionViewDelegate {
    
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
    
    var currentCell: UICollectionViewCell!
    var maskLayer: CAShapeLayer!
    
    var path: UIBezierPath!
    var isScrolling: Bool!
    var lastContentOffset: CGFloat = 0

     //MARK: - Elements
    
    private let collectionView: UICollectionView = {
        let cView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        cView.showsVerticalScrollIndicator = false
        return cView
    }()
    
    
     //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureCollectionView()
        animateCollectionView()

        
        
    }
    
    
     //MARK: - API
    
    func animateCollectionView() {
        UIView.animate(withDuration: 1.25, delay: 0.1,
          options: [.curveEaseInOut],
          animations: {
            self.collectionView.center.y -= 400
          })
    }
    
    
     //MARK: - Helpers
    
    private func configureCollectionView() {
        collectionView.register(menuCell.self, forCellWithReuseIdentifier: menuCellID)
        collectionView.delegate = self
        collectionView.dataSource = self
  
    
   
        
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


extension ViewController: UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellID, for: indexPath) as! menuCell
        currentCell = cell
        cell.menu = items[indexPath.row]
        cell.presentContents()
        cell.backgroundColor = items[indexPath.row].backgroundColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: view.frame.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? menuCell else { return }
        cell.removeAnimations()
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemDetailsVC = ItemDetailsViewController()
        self.navigationController?.pushViewController(itemDetailsVC, animated: true)
        itemDetailsVC.item = items[indexPath.row]
     
        

       
    }
    
    

    


    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.pointee.y < scrollView.contentOffset.y {
            print("DBG: Down")

        } else {
             print("DBG: UP")
       
            for cell in self.collectionView.visibleCells as! [menuCell] {
                cell.bounceBurger(y: -150)
                cell.bringBackBurger()
            }
        }
    }
  
    
}

