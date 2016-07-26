//
//  MapViewController.swift
//  PokeHeatMap For Pokemon Go
//
//  Created by youcef bouhafna on 7/20/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import CoreLocation



class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
//    let geofireRef = FIRDatabase.database().reference()
//    let geoFire = GeoFire(firebaseRef: geofireRef)

    @IBOutlet weak var aboveBannerImage: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true

        
        
        // Do any additional setup after loading the view.
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locationManager)
        let userLocation: CLLocation =  locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        self.mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "Your Current Location"
        mapView.addAnnotation(annotation)
        locationManager.stopUpdatingLocation()
    }

    
    @IBAction func locateButton(sender: AnyObject) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
