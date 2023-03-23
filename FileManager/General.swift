//
//  General.swift
//  
//
//  Created by Игорь Скворцов on 23.03.2023.
//

import Foundation
import UIKit

 extension UIImage {
     func imageWithAlpha(alpha: CGFloat) -> UIImage? {
         UIGraphicsBeginImageContextWithOptions(size, false, scale)
         draw(at: .zero, blendMode: .normal, alpha: alpha)
         let newImage = UIGraphicsGetImageFromCurrentImageContext()
         UIGraphicsEndImageContext()
         return newImage
     }
 }
