//
//  ViewController.swift
//  bangunin
//
//  Created by Fauzi Arda on 22/03/23.
//

import UIKit
import MapKit
import CoreLocation

protocol HomeDisplayLogic {
    func updateCurrentLocation()
    func displayFirstViewOfMap(_ position: AnnotationModel?, _ regionRadius: Double)
    func displayCurrentLocationNotation()
}

class HomeViewController: UIViewController, HomeDisplayLogic {
    private let locationManager = CLLocationManager()
    var location: CLLocation?
    private var userCurrentLocation: CLLocation? {
        didSet {
            displayCurrentLocationNotation()
        }
    }
    private var locationStatus: CLAuthorizationStatus?
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
            case .notDetermined: return "notDetermined"
            case .authorizedWhenInUse: return "authorizedWhenInUse"
            case .authorizedAlways: return "authorizedAlways"
            case .restricted: return "restricted"
            case .denied: return "denied"
            default: return "unknown"
        }
    }
    private let defaultLocation: AnnotationModel = .init(lat: -6.174867960298316, long: 106.82727149914197, title: "Monas")
    
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
        getPermissionForLocation()
        
        setup()
        layout()
    }
    
    private func setup() {
        currentLocationButton.addTarget(self, action: #selector(getCurrentLocation), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(mapView)
        view.addSubview(currentLocationButton)
        
        setupConstraintsForMapView()
        setupConstraintsForCurrentLocationButton()
    }
    
    private func setupConstraintsForMapView() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mapView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func setupConstraintsForCurrentLocationButton(){
        NSLayoutConstraint.activate([
            currentLocationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            currentLocationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        displayFirstViewOfMap()
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
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    func updateCurrentLocation() {}
    
    func displayFirstViewOfMap(_ position: AnnotationModel? = nil, _ regionRadius: Double = 1000) {
        var pos: AnnotationModel = position ?? defaultLocation
        let initialLocation = CLLocationCoordinate2D(latitude: pos.lat, longitude: pos.long)
        let coordinateRegion = MKCoordinateRegion(center: initialLocation, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func displayCurrentLocationNotation() {
        guard let position = userCurrentLocation else {return}
        
        setAnnotation(.init(lat: position.coordinate.latitude, long: position.coordinate.longitude, title: "Your Location"))
    }
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else {return}
        
        // update variable user current location
        userCurrentLocation = currentLocation
        mapView.setCenter(currentLocation.coordinate, animated: true)
       
       // Optionally, stop updating the location once you have obtained the initial location
       locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            locationStatus = status
            print(#function, statusString)
        }
}
