//
//  MainFeatureViewController+MKMapViewDelegate.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import MapKit

extension MainFeatureViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        guard let countryAnnotation = annotation as? Country,
              let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: CustomAnnotationView.identifier) as? CustomAnnotationView
        else {
            return nil
        }
        annotationView.frame.size.height = 40
        annotationView.frame.size.width = 40
        annotationView.flag = countryAnnotation.flag
        annotationView.hasVisited = countryAnnotation.hasVisited
        return annotationView
    }

    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        let coordinate = annotation.coordinate

        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 1_000_000,
            longitudinalMeters: 100_000
        )

        mapView.setRegion(region, animated: true)
    }
}
