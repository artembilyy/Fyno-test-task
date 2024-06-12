//
//  MainFeatureViewController.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import MapKit
import UIKit

final class MainFeatureViewController: UIViewController {
    
    private enum MapConstants {
        static let standardMapHeight: CGFloat = 450
        static let standardCameraDistance: CGFloat = 24 * 1000 * 1350
    }
    
    private lazy var mapView = MKMapView()
    private lazy var bottomSheet = BottomSheetViewController(viewModel: viewModel)
    
    var viewModel: MainFeatureViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI: do {
            view.backgroundColor = .black
            setupBottomSheet()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(bottomSheet, animated: true, completion: nil)
        setupMapView()
        focusOnPointAndShowGlobe()
    }
    
    private func setupMapView() {
        mapView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width)
        mapView.preferredConfiguration = MKHybridMapConfiguration(elevationStyle: .realistic)
        let countries = viewModel.wishlistCountries + viewModel.visitedCountries
        mapView.addAnnotations(countries)
        mapView.delegate = self
        mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: CustomAnnotationView.identifier)
        view.addSubview(mapView)
    }

    private func setupBottomSheet() {
        bottomSheet.isModalInPresentation = true
        bottomSheet.modalPresentationStyle = .pageSheet

        if let sheet = bottomSheet.sheetPresentationController {
            sheet.detents = [
                .medium(),
                .large()
            ]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.largestUndimmedDetentIdentifier = .medium
        }
    }

    private func focusOnPointAndShowGlobe() {
        let mapHeight = mapView.bounds.height
        let targetDistance = (mapHeight / MapConstants.standardMapHeight) * MapConstants.standardCameraDistance
        let originalCenter = viewModel.visitedCountries.first!.coordinate

        let latitudeOffset = 20.0
        let newLatitude = originalCenter.latitude - latitudeOffset
        let newCenter = CLLocationCoordinate2D(latitude: newLatitude, longitude: originalCenter.longitude)

        let camera = MKMapCamera(
            lookingAtCenter: newCenter,
            fromDistance: targetDistance,
            pitch: 0, heading: 0
        )
        mapView.setCamera(camera, animated: true)
    }
}
