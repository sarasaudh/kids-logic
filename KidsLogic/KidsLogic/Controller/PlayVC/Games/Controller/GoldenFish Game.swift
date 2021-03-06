//
//  GoldenFish Game.swift
//  KidsLogic
//
//  Created by sara saud on 05/05/1443 AH.
//


import Foundation
import UIKit
import AVFoundation

class GoldenFishGame: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var yContraint: NSLayoutConstraint?
    var  xContraint: NSLayoutConstraint?
    
    var xxContraint: NSLayoutConstraint?
    var yyContraint : NSLayoutConstraint?
    
    var yyyContraint : NSLayoutConstraint?
    var xxxContraint : NSLayoutConstraint?
    
    var count:Float = 0
    
    
    lazy var label1: UILabel = {
        let lbl = UILabel ()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0"
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 40)
        lbl.textAlignment = .center
        return lbl
        
    }()
    lazy var Faster: UILabel = {
        let lbl = UILabel ()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Faster"
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 40)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "startFish"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(StartPressed), for: .touchDown)
        btn.tintColor = .red
        return btn
    }()
    var Gold: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "gold"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(GoldPressed), for: .touchDown)
        return btn
    }()
    
    
    lazy var Goldfish: UIButton = {
        let lbl = UIButton()
        lbl.setImage(UIImage(named: "Gfish"), for: UIControl.State.normal)
        lbl.addTarget(self, action: #selector(GFishPressed), for: .touchDown)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.sizeToFit()
        return lbl
    }()
    lazy var blueFish: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        //        btn.setTitle(NSLocalizedString("honey bee ????", comment: ""), for: .normal)
        btn.setImage(UIImage(named:"blueFish"), for: UIControl.State.normal)
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(blueFishPressed), for: .touchDown)
        return btn
    }()
    lazy var blueFish2: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        //        btn.setTitle(NSLocalizedString("honey bee ????", comment: ""), for: .normal)
        btn.setImage(UIImage(named:"RedFish"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(RedFishPressed), for: .touchDown)
        btn.sizeToFit()
        //        btn.addTarget(self, action: #selector(move3), for: .touchDown)
        return btn
    }()
    
    // Buttons
    let BackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for:.normal)
        button.addTarget(self, action: #selector(didTapProfileButton2), for: .touchDown)
        button.tintColor = .white
        return button
    }()
    //back
    
    @objc func didTapProfileButton2() {
        
        print("profile button tapped")
        self.dismiss(animated: true)
        audioPlayer.stop()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //back
        //Button Views
        
        self.move2()
        self.move()
        self.move3()
        // Do any additional setup after loading the view.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bkGolden")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        view.addSubview(label1)
        view.addSubview(button)
        view.addSubview(Goldfish)
        view.addSubview(blueFish)
        view.addSubview(blueFish2)
        view.addSubview(Gold)
        view.addSubview(BackButton)
        
        
        NSLayoutConstraint.activate([
            
            label1.leftAnchor.constraint(equalTo: view.leftAnchor),
            label1.rightAnchor.constraint(equalTo: view.rightAnchor),
            label1.topAnchor.constraint(equalTo: view.topAnchor , constant: 130),
            
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -350) ,
            button.widthAnchor.constraint(equalToConstant: 100) ,
            button.heightAnchor.constraint(equalToConstant: 100),
            
            
            
            
            blueFish.widthAnchor.constraint(equalToConstant: 100) ,
            blueFish.heightAnchor.constraint(equalToConstant: 100),
            
            blueFish2.widthAnchor.constraint(equalToConstant: 100) ,
            blueFish2.heightAnchor.constraint(equalToConstant: 100),
            
            Goldfish.widthAnchor.constraint(equalToConstant: 70) ,
            Goldfish.heightAnchor.constraint(equalToConstant: 70),
            
            Gold.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -120) ,
            Gold.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 160) ,
            Gold.widthAnchor.constraint(equalToConstant: 70) ,
            Gold.heightAnchor.constraint(equalToConstant: 70),
            
            BackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            BackButton.centerYAnchor.constraint(equalTo: view.bottomAnchor,constant: -50) ,
            BackButton.widthAnchor.constraint(equalToConstant: 60) ,
            BackButton.heightAnchor.constraint(equalToConstant: 60),
            
            
        ])
        
        
        
        xxContraint = Goldfish.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        yyContraint = Goldfish.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170)
        
        self.yyContraint?.isActive = true
        self.xxContraint?.isActive = true
        
        
        xContraint = blueFish.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        yContraint = blueFish.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        self.yContraint?.isActive = true
        self.xContraint?.isActive = true
        
        xxxContraint = blueFish2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        yyyContraint = blueFish2.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        self.yyyContraint?.isActive = true
        self.xxxContraint?.isActive = true
        
    }
    
    //anemation
    @objc func move3() {
        
        
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
            
            self.xxxContraint?.constant = randomY
            self.yyyContraint?.constant = randomX
            
            self.view.layoutIfNeeded()
        } completion: { [self] _ in
            self.move3()
        }
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
            
            self.view.layoutIfNeeded()
        } completion: { [self] _ in
            self.move()
        }
        
    }
    
    @objc func move2() {
        
        
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
            
            self.xxContraint?.constant = randomY
            self.yyContraint?.constant = randomX
            
            self.view.layoutIfNeeded()
        } completion: { [self] _ in
            self.move2()
        }
        
        
    }
    
    
    @objc func blueFishPressed() {
        
        label1.text = "0"
        
        // Set the sound file name & extension
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "evil", ofType: "mp3")!)
        
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
    
    
    @objc func StartPressed() {
        self.move()
        self.move2()
        self.move3()
        print("Hello Fish????!")
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
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        
        
    }
    
    @objc func GoldPressed(){
        
        label1.text = "\((Int(self.label1.text ?? "0") ?? 0) + 1)"
        
        // Set the sound file name & extension
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "gold", ofType: "wav")!)
        
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
    
    @objc func RedFishPressed() {
        
        label1.text = "\((Int(self.label1.text ?? "0") ?? 0) + 1)"
        
        // Set the sound file name & extension
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "GFish", ofType: "mp3")!)
        
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
    
    @objc func GFishPressed(){
        
        label1.text = "\((Int(self.label1.text ?? "0") ?? 0) + 1)"
        
        // Set the sound file name & extension
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource:"Laugh", ofType: "mp3")!)
        
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
}

