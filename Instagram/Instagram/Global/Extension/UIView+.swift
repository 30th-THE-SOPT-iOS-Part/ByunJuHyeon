//
//  UIView+.swift
//  Instagram
//
//  Created by 변주현 on 2022/05/05.
//

import UIKit

extension UIView {
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
