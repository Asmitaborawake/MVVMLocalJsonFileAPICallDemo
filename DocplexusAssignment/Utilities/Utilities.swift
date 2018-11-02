//
//  Utilities.swift
//  DocplexusAssignment
//
//  Created by asmita.borawake on 02/11/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import Foundation
import UIKit

let postsCell = "PostsCell"
let cellIdentifier = "cell"
//extension for shadow & button
extension UIView{
    
    func applyShadow(cornerRadius: CGFloat?, color: UIColor?, opacity: Float?, offsetWidth: CGFloat?, offsetHeight: CGFloat?) -> Void {
        self.layer.cornerRadius = (cornerRadius != nil) ? cornerRadius! : CGFloat(3.0)
        self.layer.shadowColor = (color != nil) ? color?.cgColor : UIColor.darkGray.cgColor
        self.layer.shadowOffset = (offsetWidth != nil) ? CGSize(width: offsetWidth!, height: offsetHeight!) : CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = (opacity != nil) ? opacity! : Float(0.3)
        self.layer.shadowRadius = 5.0
        
    }
    
    func roundedCorners(radius: CGFloat) -> Void {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    
    
}

//extension for font & color
extension NSAttributedString {
    
    func addFontAttribute(font: UIFont) -> NSMutableAttributedString {
        let string = NSMutableAttributedString(attributedString: self)
        string.addAttribute(NSAttributedStringKey.font, value: font, range: NSRange(location: 0, length: self.length))
        return string
    }
    
    func addColorAttribute(color: UIColor) -> NSMutableAttributedString {
        let string = NSMutableAttributedString(attributedString: self)
        string.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: NSRange(location: 0, length: self.length))
        return string
    }
}
