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
        annotationView.flag = countryAnnotation.flag
        annotationView.hasVisited = countryAnnotation.hasVisited
        return annotationView
    }
}
