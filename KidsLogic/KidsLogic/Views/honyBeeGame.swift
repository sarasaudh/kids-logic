//
//  honyBeeGame.swift
//  KidsLogic
//
//  Created by sara saud on 03/05/1443 AH.
//

import Foundation
import UIKit
import AVFoundation

class honyBeeGame: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var yContraint: NSLayoutConstraint?
    var  xContraint: NSLayoutConstraint?
    
    var xxContraint: NSLayoutConstraint?
    var yyContraint : NSLayoutConstraint?
  
    var count = 0
    
    
    lazy var label1: UILabel = {
        let lbl = UILabel ()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0"
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 40)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "🐼"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(pandaPressed), for: .touchDown)
        return btn
    }()
    
    
    lazy var Hony: UIButton = {
        let lbl = UIButton()
        lbl.setImage(UIImage(named: "h"), for: UIControl.State.normal)
        lbl.addTarget(self, action: #selector(honyPressed), for: .touchDown)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.sizeToFit()
        return lbl
    }()
    lazy var redhonyboo: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        //        btn.setTitle(NSLocalizedString("honey bee 🐝", comment: ""), for: .normal)
        btn.setImage(UIImage(named:"redhonybee"), for: UIControl.State.normal)
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(redhonyPressed), for: .touchDown)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "hony")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        view.addSubview(label1)
        view.addSubview(button)
        view.addSubview(Hony)
        view.addSubview(redhonyboo)
        
        NSLayoutConstraint.activate([
            
            label1.leftAnchor.constraint(equalTo: view.leftAnchor),
            label1.rightAnchor.constraint(equalTo: view.rightAnchor),
            label1.topAnchor.constraint(equalTo: view.topAnchor , constant: 130),
            
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300) ,
            button.widthAnchor.constraint(equalToConstant: 100) ,
            button.heightAnchor.constraint(equalToConstant: 100),
            
            
           
            redhonyboo.widthAnchor.constraint(equalToConstant: 100) ,
            redhonyboo.heightAnchor.constraint(equalToConstant: 100),
            
            Hony.widthAnchor.constraint(equalToConstant: 70) ,
            Hony.heightAnchor.constraint(equalToConstant: 70)
            
        ])
        
        
//        xxContraint = redhonyboo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        yyContraint = redhonyboo.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//
//        self.yyContraint?.isActive = true
//        self.xxContraint?.isActive = true
//
//        @objc func move2() {
//
//            let viewHalfWidth = view.bounds.size.width / 2
//            let viewHalfHeight = view.bounds.size.height / 2
//
//            let randomX = CGFloat.random(in: -viewHalfWidth..<viewHalfWidth)
//            let randomY = CGFloat.random(in: -viewHalfHeight..<viewHalfHeight)
//
//            let maxTime: TimeInterval
//            let minTime: TimeInterval
//
//            if count > 20 {
//                maxTime = 0.5
//                minTime = 1.2
//            }else{
//                maxTime = 0.25
//                minTime = 0.1
//            }
//            let randomTime = TimeInterval.random(in: minTime...maxTime)
//
//            UIView.animate(withDuration: 3, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: [.curveLinear, .allowUserInteraction]) {
//                self.xxContraint?.constant = randomX
//                self.yyContraint?.constant = randomY
//                self.view.layoutIfNeeded()
//            } completion: { [self] _ in
//                self.move2()
//            }
//
//        }
        
        xxContraint = Hony.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        yyContraint = Hony.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170)
        
        self.yyContraint?.isActive = true
        self.xxContraint?.isActive = true
        
        
        xContraint = redhonyboo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ,Hony.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        yContraint = redhonyboo.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        self.yContraint?.isActive = true
        self.xContraint?.isActive = true
        
        
    }
    
    @objc func move() {
        
        
        //   label1.text = "\((Int(self.label1.text ?? "0") ?? 0) + 1)"
        
        
        let viewHalfWidth = view.bounds.size.width / 2
        let viewHalfHeight = view.bounds.size.height / 2
        
        let randomX = CGFloat.random(in: -viewHalfWidth..<viewHalfWidth)
        let randomY = CGFloat.random(in: -viewHalfHeight..<viewHalfHeight)
        
        let maxTime: TimeInterval
        let minTime: TimeInterval
        
        if count > 20 {
            maxTime = 0.5
            minTime = 1.2
        }else{
            maxTime = 0.25
            minTime = 0.1
        }
        let randomTime = TimeInterval.random(in: minTime...maxTime)
        
        UIView.animate(withDuration: 3, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: [.curveLinear, .allowUserInteraction]) {
            self.xContraint?.constant = randomX
            self.yContraint?.constant = randomY
            self.xxContraint?.constant = randomY
            self.yyContraint?.constant = randomX
            
            self.view.layoutIfNeeded()
        } completion: { [self] _ in
            self.move()
        }
        
    }
    
    
    @objc func redhonyPressed() {
        
        label1.text = "0"
        
        // Set the sound file name & extension
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Sad", ofType: "mp3")!)
        
        do {
            // Preperation
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
        }
        
        // Play the sound
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: alertSound)
        } catch _{
        }
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        
        
    }
    
    
    @objc func pandaPressed() {
        self.move()
//        self.move2()
        
        print("Hello Panda 🐼!")
        // Set the sound file name & extension
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "on", ofType: "mp3")!)
        
        do {
            // Preperation
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
        }
        
        // Play the sound
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: alertSound)
        } catch _{
        }
        //        stop voice
        //        [self.webView loadRequest:NSURLRequestFromString(@"about:blank")]
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        
    }
    
    @objc func honyPressed(){
        
        label1.text = "\((Int(self.label1.text ?? "0") ?? 0) + 1)"
        
        // Set the sound file name & extension
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Laugh", ofType: "mp3")!)
        
        do {
            // Preperation
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
        }
        
        // Play the sound
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: alertSound)
        } catch _{
        }
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        //        label1.text = "\(count += 1)"
        //        self.count += 1
        //    self.label1.text = "\((Int(self.label1.text ?? "0") ?? 0) + 1)"
    }
}

