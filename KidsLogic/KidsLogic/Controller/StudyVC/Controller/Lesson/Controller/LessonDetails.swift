//
//  LessonDetails.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//
import Foundation

import UIKit
import SwiftUI
import AVFoundation
class LessonDetailVC: UIViewController {
   
    var isReadit = Bool()
    var audioPlayer = AVAudioPlayer()
    var lessonImage: String?
    var lessonTitle: String?
    var lessonDescription: String?
    var LessonNumber: String?
    
    
    // MARK: - properties

    let bImage: UIImageView =  {
        let image           = UIImageView()
        image.contentMode   = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
  
    private let bTitle: UILabel = {
        let title = UILabel()
        title.textColor     =  .systemOrange
        title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 27, weight: .bold))
        title.textAlignment = .center
        return title
    }()
    
    
    private let bDescription: UITextView = {
        let description             = UITextView()
        description.textColor       =  UIColor.systemGray6
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 30, weight: .regular))
        description.textAlignment   = .natural
        description.backgroundColor = UIColor(named: "DarkColor")
        description.isEditable = false
        return description
    }()
    
    
    private let LNum: UILabel = {
        let title = UILabel()
        title.textColor     =  .systemMint
        title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))
        title.textAlignment = .right
        return title
    }()
    
    
    private let Lvoice: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "nicepanda"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(pandaVPressed), for: .touchDown)
        return btn
    }()
    
    var readitBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named:"checkmark.seal"), for: UIControl.State.normal)
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(readChecked), for: .touchUpInside)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        btn.tintColor = .blue
        return btn
    }()
    
//MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkColor")
        self.title = "Logic Lessons "
        self.navigationItem.largeTitleDisplayMode = .never
        
        setupView()
      
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "DarkColor")
        guard let lesImage = lessonImage else {return}
        guard let lesTitle = lessonTitle else {return}
        guard let lesDes = lessonDescription else {return}
        guard let lesnum = LessonNumber else {return}
//        guard let CheckRead = isReadit else {return}
        
        
        //image
        bImage.translatesAutoresizingMaskIntoConstraints                                        = false
        
        view.addSubview(bImage)
        bImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive       = true
        bImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive                       = true
        bImage.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3).isActive    = true
        
        
        //title
        bTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bTitle)
        
        bTitle.topAnchor.constraint(equalTo: bImage.bottomAnchor, constant: 20).isActive        = true
        bTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive     = true
        bTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive  = true
        bTitle.heightAnchor.constraint(equalToConstant: 40).isActive                            = true
        
        Lvoice.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Lvoice)
        Lvoice.topAnchor.constraint(equalTo: bImage.bottomAnchor ).isActive        = true
        Lvoice.leadingAnchor.constraint(equalTo: view.trailingAnchor).isActive     = true
        Lvoice.trailingAnchor.constraint(equalTo: bTitle.trailingAnchor).isActive  = true
        Lvoice.heightAnchor.constraint(equalToConstant: 80).isActive                            = true
        Lvoice.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        //number
        LNum.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(LNum)
        
        LNum.topAnchor.constraint(equalTo: bImage.bottomAnchor, constant: 20).isActive        = true
        LNum.leadingAnchor.constraint(equalTo: bTitle.leadingAnchor, constant: 19).isActive     = true
        LNum.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive  = true
        LNum.heightAnchor.constraint(equalToConstant: 40).isActive                            = true
        
        
        bDescription.translatesAutoresizingMaskIntoConstraints                                 = false
        view.addSubview(bDescription)
        bDescription.topAnchor.constraint(equalTo: LNum.bottomAnchor, constant: 10).isActive          = true
        bDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive       = true
        bDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive    = true
        bDescription.heightAnchor.constraint(equalToConstant: 400).isActive                             = true
        
        view.addSubview(readitBtn)

        readitBtn.topAnchor.constraint(equalTo: bImage.bottomAnchor ).isActive        = true
        readitBtn.leadingAnchor.constraint(equalTo: view.trailingAnchor).isActive     = true
        readitBtn.trailingAnchor.constraint(equalTo: bTitle.trailingAnchor,constant:-40).isActive  = true
        readitBtn.heightAnchor.constraint(equalToConstant: 80).isActive                            = true
        readitBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        
        bImage.image        = UIImage(named: lesImage)
        bTitle.text         = lesTitle
        bDescription.text   = lesDes
        LNum.text           = lesnum
    
    }
    
    
    
    
    //MARK: - func
    
    
    @objc func readChecked() {
        DispatchQueue.main.async {
            if self.isReadit == false {
                   let image1 = UIImage(systemName: "checkmark.seal.fill") as UIImage?
                   self.readitBtn.setImage(image1, for: .normal)
                   self.isReadit = true
                   print("readit")
                   
               }else {
                   let image2 = UIImage(systemName: "checkmark.seal") as UIImage?
                   self.readitBtn.setImage(image2, for: .normal)
                   self.isReadit = false
                   print("Unreadit")
                  
               }
        }
           
     }
    
    
    @objc func pandaVPressed() {
        
        print("Hello Panda 🐼!")
        // Set the sound file name & extension
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "nice", ofType: "mp3")!)
        
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
    
}
