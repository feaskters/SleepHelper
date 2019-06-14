//
//  RunViewController.swift
//  SleepHelper
//
//  Created by role on 2019/6/14.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class RunViewController: UIViewController {

    @IBOutlet weak var count: UILabel!
    
    var biaoqing = BiaoQingImageView.init(frame: CGRect.init())
    override func viewDidLoad() {
        super.viewDidLoad()
        biaoqing.create()
        self.view.addSubview(biaoqing)
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
        UIView.animate(withDuration: 4, animations: {
            sheep.frame = CGRect.init(x: UIScreen.main.bounds.width / 2, y: 180, width: 0, height: 0)
        }) { (Bool) in
            self.count.text = String(Int(self.count.text!)! + 1)
            //判断数字增加表情包
            if Int(self.count.text!)! % 50 == 0{
                self.biaoqing.show()
            }
            sheep.removeFromSuperview()
        }
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
