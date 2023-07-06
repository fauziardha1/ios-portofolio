//
//  ViewController.swift
//  bangunin
//
//  Created by Fauzi Arda on 22/03/23.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController {
    private let locationManager = CLLocationManager()
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    lazy var currentLocationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "currentLocationImage"), for: .normal)
        
        button.backgroundColor = .white
        button.contentEdgeInsets = UIEdgeInsets(top: 17, left: 14, bottom: 12, right: 16)
        button.layer.cornerRadius = 25
        button.tintColor = UIColor(named: "banguninPrimaryColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Set shadow properties
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        title = "Main View Controller"
        
        setup()
        layout()
    }
    
    private func setup() {
        currentLocationButton.addTarget(self, action: #selector(getCurrentLocation), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(mapView)
        view.addSubview(currentLocationButton)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mapView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
        setupConstraintsForCurrentLocationButton()
    }
    
    private func setupConstraintsForCurrentLocationButton(){
        NSLayoutConstraint.activate([
            currentLocationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            currentLocationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let initialLocation = CLLocationCoordinate2D(latitude: -6.2248109477768425, longitude: 106.82952080866995) // Kuningan city
            
            let regionRadius: CLLocationDistance = 1000 // 1km
            
            let coordinateRegion = MKCoordinateRegion(center: initialLocation, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            
            mapView.setRegion(coordinateRegion, animated: true)
        setAnnotation(.init(lat: -6.2248109477768425, long:  106.82952080866995, title: "You"))
        
        getPermissionForLocation()
    }
    
    private func setAnnotation(_ point: AnnotationModel){
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: point.lat, longitude: point.long)
        annotation.title = point.title
        annotation.subtitle = point.subTitle
        mapView.addAnnotation(annotation)
    }
    
    @objc private func getCurrentLocation() {
        locationManager.startUpdatingLocation()
    }
    
    private func getPermissionForLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}


extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else {
           return
       }
       
       // Use the currentLocation coordinate to set the map's center
       let coordinate = currentLocation.coordinate
       mapView.setCenter(coordinate, animated: true)
       
       // Optionally, stop updating the location once you have obtained the initial location
       locationManager.stopUpdatingLocation()
    }
    
}

