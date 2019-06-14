//
//  BiaoQingImageView.swift
//  SleepHelper
//
//  Created by role on 2019/6/14.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class BiaoQingImageView: UIImageView {

    func create() {
        self.frame = CGRect.init(x: UIScreen.main.bounds.width / 2 - 125, y: UIScreen.main.bounds.height / 2 - 150, width: 250, height: 250)
        self.alpha = 0
    }

    func show() {
        let x = Int(arc4random() % 18 + 10)
        self.image = UIImage.init(named: String(x))
        UIView.animate(withDuration: 1.5, animations: {
            self.alpha = 1
        }) { (Bool) in
            UIView.animate(withDuration: 1.5, animations: {
                self.alpha = 0
            })
        }
    }
}
