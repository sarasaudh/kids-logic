//
//  Colors.swift
//  Snapchat
//
//  Created by HANAN on 04/04/1443 AH.
//

import UIKit
import Foundation

//enum or stract


enum colors {
    static let button = UIColor(red:0.58, green:0.26, blue:0.25, alpha:1.0)
    static let backgroundDarckcolor = UIColor(#colorLiteral(red: 0.4832331538, green: 0.7777528763, blue: 1, alpha: 1))
    static let backgroundLightcolor = UIColor(#colorLiteral(red: 1, green: 0.5124602318, blue: 0.4691804051, alpha: 1))
}
enum colors1{
    static let backgroundDarckcolor  = UIColor(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
   static let backgroundLightcolor  = UIColor(#colorLiteral(red: 0.4832331538, green: 0.7777528763, blue: 1, alpha: 1))
}
enum colors2 {
    static let backgroundLightcolor = UIColor(#colorLiteral(red: 0.4004689157, green: 0.913308382, blue: 1, alpha: 1))
    static let backgroundDarckcolor = UIColor(#colorLiteral(red: 0.3914309144, green: 0.9054350257, blue: 0.9928495288, alpha: 1))
    static let backgroundleftColor = UIColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    static let backgroundRightcolor = UIColor(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
}
enum colors3 {
    static let backgroundLightcolor = UIColor(#colorLiteral(red: 0.7368935943, green: 0.8787849545, blue: 0.2236331105, alpha: 1))
    static let backgroundleftColor = UIColor(#colorLiteral(red: 0.8015808463, green: 0.9898696542, blue: 0.8042283654, alpha: 1))
    static let backgroundRightcolor = UIColor(#colorLiteral(red: 0.8015808463, green: 0.9898696542, blue: 0.8042283654, alpha: 1))
    static let backgroundRightcolor2 = UIColor(#colorLiteral(red: 0.8015808463, green: 0.9898696542, blue: 0.8042283654, alpha: 1))

}
enum colors4{
    static let backgroundDarckcolor  = UIColor(#colorLiteral(red: 0.9998961091, green: 1, blue: 0.01913678646, alpha: 1))
   static let backgroundLightcolor  = UIColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    static let backgroundLightcolor2  = UIColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
}
// Gradiant background


extension UIView {
    
    //  all these must be add in the extionsion ^
    
    func setGradiantView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [colors.backgroundLightcolor.cgColor, colors.backgroundDarckcolor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    func setGradiantView1() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [colors1.backgroundLightcolor.cgColor, colors1.backgroundDarckcolor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    func setGradiantView2() {
        let gradientLayer2 = CAGradientLayer()
        gradientLayer2.frame = self.bounds
        gradientLayer2.colors = [colors2.backgroundDarckcolor.cgColor,colors2.backgroundLightcolor.cgColor,colors2.backgroundleftColor.cgColor,colors2.backgroundRightcolor.cgColor]
        layer.insertSublayer(gradientLayer2, at: 0)
    }
    func setGradiantView3() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [colors3.backgroundLightcolor.cgColor,colors3.backgroundleftColor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    func setGradiantView4() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [colors4.backgroundLightcolor2.cgColor,colors4.backgroundLightcolor.cgColor, colors4.backgroundDarckcolor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
   
}






