//
//  MapVC.swift
//  KidsLogic
//
//  Created by sara saud on 08/05/1443 AH.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManger: CLLocationManager!
    
    lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "info")
        imageView.contentMode = .top
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .quaternaryLabel
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
    
    lazy  var mapView: MKMapView  = {
        let mv = MKMapView()
        mv.translatesAutoresizingMaskIntoConstraints = false
        return mv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        NSLayoutConstraint.activate([
            
            infoImageView.topAnchor.constraint(equalTo: view.topAnchor),
            infoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor) ,
            
            infoImageView.widthAnchor.constraint(equalToConstant: 400),
            infoImageView.heightAnchor.constraint(equalToConstant:300),
            
            
//
            mapView.topAnchor.constraint(equalTo: infoImageView.bottomAnchor),
            mapView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        guard let location = locations.last else {return}
        let lat = location.coordinate.latitude
        let long = location.coordinate.longitude
        
        
        let loc = MKPointAnnotation()
        loc.title = "KidsLogic Center"
        loc.coordinate = CLLocationCoordinate2D(latitude: 21.543333, longitude: 39.172779)
        mapView.addAnnotation(loc)
    }

}
