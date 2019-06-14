//
//  SelectButton.swift
//  SleepHelper
//
//  Created by role on 2019/6/13.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class SelectButton: UIButton {

    func config(image:String, number:Int) {
        let space : CGFloat = 50
        let button_width = UIScreen.main.bounds.width / 2 - space
        let button_height = button_width
        let button_x = space / 2 + (button_width + space) * CGFloat(number % 2)
        let button_y = (button_height + space) * CGFloat(Int(number / 2))
        self.frame = CGRect.init(x: button_x, y: button_y, width: button_width, height: button_height)
        let background = UIImage.init(named: "border")
        self.setBackgroundImage(background, for: UIControl.State.normal)
        
        //设置内容图片
        let picture = UIImage.init(named: image)
        self.setImage(picture, for: UIControl.State.normal)
    }

}
