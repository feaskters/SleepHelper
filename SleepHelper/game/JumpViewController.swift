//
//  JumpViewController.swift
//  SleepHelper
//
//  Created by role on 2019/6/13.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class JumpViewController: UIViewController {

    @IBOutlet weak var count: UILabel!
    var biaoqing = BiaoQingImageView.init(frame: CGRect.init())
    override func viewDidLoad() {
        super.viewDidLoad()
        biaoqing.create()
        self.view.addSubview(biaoqing)
        
        EffectiveClass.baiYeIn(view: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        EffectiveClass.baiYeIn(view: self.view)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        Music.shared().musicPlayEffective()
        let sheep = SheepImageView.init(frame: CGRect.init(x: 10, y: UIScreen.main.bounds.height - 200, width: 80, height: 150))
        self.view.addSubview(sheep)
        sheep.runRight()
        UIView.animate(withDuration: 1.25, animations: {
            sheep.frame = CGRect.init(x: UIScreen.main.bounds.width / 2 - 120, y: UIScreen.main.bounds.height - 200, width: 80, height: sheep.frame.height)
        }) { (Bool) in
            UIView.animate(withDuration: 0.4, animations: {
                sheep.jumpRight()
                sheep.frame = CGRect.init(x: UIScreen.main.bounds.width / 2 - 30, y: UIScreen.main.bounds.height - 300, width: 80, height: sheep.frame.height)
            }) { (Bool) in
                UIView.animate(withDuration: 0.4, animations: {
                    //数字增加
                    self.count.text = String(Int(self.count.text!)! + 1)
                    //判断数字增加表情包
                    if Int(self.count.text!)! % 50 == 0{
                        self.biaoqing.show()
                    }
                    sheep.frame = CGRect.init(x: UIScreen.main.bounds.width / 2 + 60, y: UIScreen.main.bounds.height - 200, width: 80, height: sheep.frame.height * 2)
                }) { (Bool) in
                    UIView.animate(withDuration: 1.25, animations: {
                        sheep.frame = CGRect.init(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height - 200, width: 80, height: sheep.frame.height)
                    }) { (Bool) in
                        sheep.removeFromSuperview()
                    }
                }
            }
        }
    }

    @IBAction func click(_ sender: UIButton) {
        EffectiveClass.baiYeOut(view: self.view)
        Music.shared().musicPlayEffective()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(0.9)) {
            self.dismiss(animated: false, completion: nil)
        }
    }

}
