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
    
    lazy var tipbar : UIView = {
        let width = UIScreen.main.bounds.width / 2 + 50
        let height : CGFloat = 200
        let tipbar = UIView.init(frame: CGRect.init(x: width - 50, y: -300, width: width, height: 0))
        
        let tipback = UIImageView.init(image: UIImage.init(named: "tipback"))
        tipback.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        tipbar.addSubview(tipback)
        
        let tiplabel = UILabel.init(frame: CGRect.init(x: 50, y: 0, width: width - 100, height: 200))
        tiplabel.numberOfLines = 0
        tiplabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        tiplabel.text = "You just need to tap the screen to count the sheep and then enter the sweet dreams."
        if SystemLanguageClass.getCurrentLanguage() == "cn"{
            tiplabel.text = "你只需要点击屏幕来数羊，然后进入香甜的梦乡"
        }
        tipbar.addSubview(tiplabel)
        
        return tipbar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tipbar)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            //标题晃动效果
            EffectiveClass.scale(view: self.titleLabel)
        }
        let max = 5
        //设置scrollview
        scrollView.contentSize = CGSize.init(width: scrollView.frame.width, height: CGFloat(max / 2 + 1) * (UIScreen.main.bounds.width / 2) + 80)
        //添加按钮
        for i in 0...max {
            if i == 3{
                continue
            }
            let button = SelectButton.init()
            //button.setTitle("jump", for: UIControl.State.normal)
           
            if i == 4 {
                button.config(image: "unmute", number: i)
                button.addTarget(self, action: #selector(self.mute(sender:)), for: UIControl.Event.touchUpInside)
            }else{
                if i == 5{
                     button.config(image: "info", number: i)
                    button.addTarget(self, action: #selector(self.info(sender:)), for: UIControl.Event.touchUpInside)
                }else{
                    button.config(image: String(i * 2), number: i)
                    //添加点击事件
                    button.addTarget(self, action: #selector(self.button_click(sender:)), for: UIControl.Event.touchUpInside)
                }
            }
            button.tag = i
            scrollView.addSubview(button)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //入场动画
        EffectiveClass.baiYeIn(view: self.view)
    }

    @objc func mute(sender:UIButton){
        let volume = Music.shared().getMuteVolume()
        if volume == 0 {
            sender.setImage(UIImage.init(named: "unmute"), for: UIControl.State.normal)
        }else{
            sender.setImage(UIImage.init(named: "mute"), for: UIControl.State.normal)
        }
        Music.shared().musicChangeMute()
    }
    
    @objc func info(sender:UIButton){
        Music.shared().musicPlayEffective()
        
        let width = UIScreen.main.bounds.width / 2 + 50
        let height : CGFloat = 200
        
        if self.tipbar.frame.origin.y <= 0 {
            //显示提示View
            UIView.animate(withDuration: 0.5, animations: {
                self.tipbar.frame = CGRect.init(x: (width - 50) / 2, y: UIScreen.main.bounds.height / 2 - 100, width: width, height: height)
            }) { (Bool) in
                EffectiveClass.jump(view: self.tipbar)
            }
        }else{
            //关闭提示view
            UIView.animate(withDuration: 0.8, animations: {
                self.tipbar.frame = CGRect.init(x: width - 100, y: -300, width: width, height: 0)
            })
        }
    }
    
    //按钮点击事件
    @objc func button_click(sender:UIButton){
        EffectiveClass.baiYeOut(view: self.view)
        Music.shared().musicPlayEffective()
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

