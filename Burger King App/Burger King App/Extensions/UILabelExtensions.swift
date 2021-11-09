//
//  File.swift
//  Burger King App
//
//  Created by Rachit Prajapati on 09/11/21.
//

import UIKit

extension UILabel {
    static func createItemName(color: UIColor, size: CGFloat, text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor =  color
        label.font = UIFont(name: "InsaniburgerwithCheese", size: size)
        return label
    }
}
