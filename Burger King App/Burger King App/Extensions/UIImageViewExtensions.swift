//
//  UIImageViewExtensions.swift
//  Burger King App
//
//  Created by Rachit Prajapati on 09/11/21.
//

import Foundation
import UIKit

extension UIImageView {
    
    func create(name: String, width: CGFloat = 30, height: CGFloat = 40) -> UIImageView {
        let iv = UIImageView()
        iv.setDimensions(width: width, height: height)
        iv.image = UIImage(named: name)
        iv.contentMode = .scaleAspectFill
        return  iv
    }
    
    static func createItems(width: CGFloat, height: CGFloat, imageName: String) -> UIImageView {
        let iv = UIImageView()
        iv.contentMode  = .scaleAspectFill
        iv.image = UIImage(named: imageName)
        iv.setDimensions(width: width, height: height)
        return iv
    }
    
}

