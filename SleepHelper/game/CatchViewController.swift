//
//  CatchViewController.swift
//  SleepHelper
//
//  Created by role on 2019/6/14.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class CatchViewController: UIViewController {

    let screenbounds = UIScreen.main.bounds
    var timer:Timer?
    lazy var ufo:UFOView = {
        let ufo = UFOView.init(frame: CGRect.init(x: 0, y: 60, width: 0, height: 0))
        return ufo
    }()
    var biaoqing = BiaoQingImageView.init(frame: CGRect.init())
    
    @IBOutlet weak var count: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(ufo)
        ufo.getUFO()
        biaoqing.create()
        self.view.addSubview(biaoqing)
        //ufo移动方向
        var dir = 1
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.015, repeats: true) { (Timer) in
            if dir == 1{
                self.ufo.frame = CGRect.init(x: self.ufo.frame.origin.x + 1, y: self.ufo.frame.origin.y, width: self.ufo.frame.width, height: self.ufo.frame.height)
                if self.ufo.frame.origin.x > UIScreen.main.bounds.width - self.ufo.frame.width{
                    dir = -1
                }
            }else{
                self.ufo.frame = CGRect.init(x: self.ufo.frame.origin.x - 1, y: self.ufo.frame.origin.y, width: self.ufo.frame.width, height: self.ufo.frame.height)
                if self.ufo.frame.origin.x < 0 {
                    dir = 1
                }
            }
        }
     }
    
    override func viewWillAppear(_ animated: Bool) {
        EffectiveClass.baiYeIn(view: self.view)
    }
    
    @IBAction func back(_ sender: Any) {
        Music.shared().musicPlayEffective()
        EffectiveClass.baiYeOut(view: self.view)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(0.9)) {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        Music.shared().musicPlayEffective()
        let x = arc4random() % UInt32(UIScreen.main.bounds.width)
        let sheep = SheepImageView.init(frame: CGRect.init(x: CGFloat( x), y: UIScreen.main.bounds.height - 200, width: 80, height: 150))
        self.view.addSubview(sheep)
        if CGFloat(x) <= UIScreen.main.bounds.width / 2 - 40 {
            sheep.runRight()
        }else{
            sheep.runLeft()
        }
        
        //羊球
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(1.5), execute: {
            sheep.ball()
        })
        //被捕获
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (Timer) in
            let insect_x : CGFloat = sheep.frame.origin.x > self.ufo.frame.origin.x + self.ufo.frame.width / 2  - 10 ? -1 : 1
            sheep.frame = CGRect.init(x: sheep.frame.origin.x + insect_x, y: sheep.frame.origin.y - 1.1, width: sheep.frame.width - 0.1, height: sheep.frame.height - 0.1)
            if sheep.frame.origin.y <= self.ufo.frame.origin.y + 120{
                self.count.text = String(Int(self.count.text!)! + 1)
                //判断数字增加表情包
                if Int(self.count.text!)! % 50 == 0{
                    self.biaoqing.show()
                }
                sheep.removeFromSuperview()
                Timer.invalidate()
            }
        }
//        UIView.animate(withDuration: 4, animations: {
//            sheep.frame = CGRect.init(x: self.ufo.frame.origin.x + self.ufo.frame.width / 2, y: self.ufo.frame.origin.y + 120, width: 0, height: 0)
//        }) { (Bool) in
//            self.count.text = String(Int(self.count.text!)! + 1)
//            sheep.removeFromSuperview()
//        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
