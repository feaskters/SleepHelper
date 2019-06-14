//
//  ViewController.swift
//  SleepHelper
//
//  Created by role on 2019/6/13.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            //标题晃动效果
            EffectiveClass.scale(view: self.titleLabel)
        }
        let max = 4
        //设置scrollview
        scrollView.contentSize = CGSize.init(width: scrollView.frame.width, height: CGFloat(max / 2 + 1) * (UIScreen.main.bounds.width / 2) + 80)
        //添加按钮
        for i in 0...max {
            let button = SelectButton.init()
            //button.setTitle("jump", for: UIControl.State.normal)
            if i == 3 {
                button.config(image: "7", number: i)
            }else{
                button.config(image: String(i * 2), number: i)
            }
            button.tag = i
            scrollView.addSubview(button)
            //添加点击事件
            button.addTarget(self, action: #selector(self.button_click(sender:)), for: UIControl.Event.touchUpInside)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //入场动画
        EffectiveClass.baiYeIn(view: self.view)
    }

    //按钮点击事件
    @objc func button_click(sender:UIButton){
        EffectiveClass.baiYeOut(view: self.view)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(0.9)) {
            switch sender.tag {
            case 0:
                let jvc = JumpViewController.init(nibName: nil, bundle: nil)
                self.present(jvc, animated: false, completion: nil)
                break
            case 1:
                let rvc = RunViewController.init(nibName: nil, bundle: nil)
                self.present(rvc, animated: false, completion: nil)
                break
            case 2:
                let cvc = CatchViewController.init(nibName: nil, bundle: nil)
                self.present(cvc, animated: false, completion: nil)
                break
            default: break
                
            }
        }
        
    }
}

