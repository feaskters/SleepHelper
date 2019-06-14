//
//  UFOView.swift
//  SleepHelper
//
//  Created by role on 2019/6/14.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class UFOView: UIView {

    let screenbounds = UIScreen.main.bounds
    
    func getUFO() {
        self.backgroundColor = nil
        let width : CGFloat = screenbounds.width / 2 - 50
        let height : CGFloat = 800
        self.frame = CGRect.init(x: self.frame.origin.x, y: 120, width: width, height: height)
        
        //添加ufo本体
        let ufo = UIImageView.init(image: UIImage.init(named: "UFO"))
        ufo.frame = CGRect.init(x: 0, y: 0, width: width, height: 100)
        
        //添加ufo光效
        let ufo_light = UIImageView.init(image: UIImage.init(named: "UFO_Light"))
        ufo_light.frame = CGRect.init(x: width / 2 - 100, y: 80, width: 200, height: 400)
        self.addSubview(ufo_light)
        self.addSubview(ufo)
    }

}
