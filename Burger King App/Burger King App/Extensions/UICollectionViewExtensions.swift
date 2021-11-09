//
//  UICollectionViewExtensions.swift
//  Burger King App
//
//  Created by Rachit Prajapati on 09/11/21.
//

import Foundation
import UIKit

extension MenuController: UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.menuCellID, for: indexPath) as! menuCell
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
        print("lol")
        

       
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


