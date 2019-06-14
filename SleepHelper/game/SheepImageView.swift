//
//  SheepImageView.swift
//  SleepHelper
//
//  Created by role on 2019/6/13.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class SheepImageView: UIImageView {
    
    lazy var imageSet:Array<UIImage> = {
        var imageSets = Array<UIImage>.init()
        for i in 0...9{
             imageSets.append(UIImage.init(named: String(i))!)
        }
        return imageSets
    }()
    
    func runRight() {
        var imageSets = Array<UIImage>.init()
        imageSets.append(imageSet[3])
        imageSets.append(imageSet[4])
        self.animationImages = imageSets
        self.animationRepeatCount = -1
        self.animationDuration = 0.3
        self.startAnimating()
    }
    
    func runLeft() {
        var imageSets = Array<UIImage>.init()
        imageSets.append(imageSet[1])
        imageSets.append(imageSet[2])
        self.animationImages = imageSets
        self.animationRepeatCount = -1
        self.animationDuration = 0.3
        self.startAnimating()
    }
    
    func jumpRight() {
        self.stopAnimating()
        self.frame = CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height / 2)
        self.image = imageSet[5]
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(0.8)) {
            self.runRight()
        }
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(0.6)) {
//            self.image = self.imageSet[5]
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(0.7)) {
//            self.runRight()
//        }
    }

    func ball(){
        var imageSets = Array<UIImage>.init()
        imageSets.append(imageSet[2])
        imageSets.append(imageSet[5])
        self.frame = CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height / 2)
        self.animationImages = imageSets
        self.animationRepeatCount = -1
        self.animationDuration = 0.3
        self.startAnimating()
    }
    
}
