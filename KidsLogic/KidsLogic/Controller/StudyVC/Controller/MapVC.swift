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

    
    lazy  var mapView: MKMapView  = {
        let MV = MKMapView()
        MV.translatesAutoresizingMaskIntoConstraints = false
        return MV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let me = MKPointAnnotation()
        me.title = "KidsLogic 🐼"
        me.coordinate =  CLLocationCoordinate2D(latitude: 21.543333, longitude: 39.172779)
        mapView.addAnnotation(me)
        
        
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

        NSLayoutConstraint.activate([
   
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    

}
