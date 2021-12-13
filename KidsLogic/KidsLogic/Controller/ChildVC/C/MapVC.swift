//
//  MapVC.swift
//  KidsLogic
//
//  Created by sara saud on 08/05/1443 AH.
//

import UIKit
import MapKit
import CoreLocation
import WebKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManger: CLLocationManager!
    
    lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "info")
        imageView.contentMode = .top
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30

        return imageView
    }()
    
    lazy  var mapView: MKMapView  = {
        let MV = MKMapView()
        MV.translatesAutoresizingMaskIntoConstraints = false
        return MV
    }()
    let LinkImage:UIImage? = UIImage(named: "Link")
  lazy var websitelabel: UIButton = {
        let button = UIButton (type: .system)

        button.setBackgroundImage(LinkImage, for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//      button.setTitle(NSLocalizedString("Link", comment: ""), for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(LinkPressed), for: .touchUpInside)
        button.layer.masksToBounds = true
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let me = MKPointAnnotation()
                me.title = "KidsLogic Cente"
                me.coordinate =  CLLocationCoordinate2D(latitude: 21.543333, longitude: 39.172779)
        mapView.addAnnotation(me)
            
        websitelabel.addTarget(self, action: "LinkPressed", for: .touchUpInside)
       
    
        view.backgroundColor = .white
        mapView.delegate = self
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManger = CLLocationManager()
            locationManger.delegate = self
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.requestAlwaysAuthorization()
            locationManger.startUpdatingLocation()
        }
        
        view .addSubview(mapView)
        view .addSubview(infoImageView)
        view .addSubview(websitelabel)
        NSLayoutConstraint.activate([
            
            infoImageView.topAnchor.constraint(equalTo: view.topAnchor),
            infoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,

            infoImageView.widthAnchor.constraint(equalToConstant: 400),
            infoImageView.heightAnchor.constraint(equalToConstant:300),
            
            websitelabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 215),
            websitelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 70) ,

            websitelabel.widthAnchor.constraint(equalToConstant: 170),
            websitelabel.heightAnchor.constraint(equalToConstant:50),

            
//
            mapView.topAnchor.constraint(equalTo: infoImageView.bottomAnchor),
            mapView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    

    @objc private func LinkPressed() {
        UIApplication.shared.openURL(NSURL(string: "https://sites.google.com/view/sarasaudh/home")! as URL)
       }
}
