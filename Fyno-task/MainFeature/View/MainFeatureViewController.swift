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
        static let centerCoordinateDistance: CGFloat = 35_000_000
    }

    private lazy var mapView = MKMapView()
    private lazy var bottomSheet = BottomSheetViewController(viewModel: viewModel)

    var viewModel: MainFeatureViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI: do {
            view.backgroundColor = .white
            setupBottomSheet()
            DispatchQueue.main.async {
                self.setupMapView()
            }
        }
    }

    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        present(bottomSheet, animated: false, completion: nil)
    }

    private func setupMapView() {
        view.addSubview(mapView)
        mapView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width * 1.2)
        mapView.preferredConfiguration = MKHybridMapConfiguration(elevationStyle: .realistic)
        let countries = viewModel.bucketlistCountries + viewModel.visitedCountries
        mapView.addAnnotations(countries)
        mapView.delegate = self
        mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: CustomAnnotationView.identifier)

        let camera = MKMapCamera()
        camera.centerCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        camera.centerCoordinateDistance = MapConstants.centerCoordinateDistance
        camera.pitch = 0
        camera.heading = 0
        mapView.camera = camera
    }

    private func setupBottomSheet() {
        bottomSheet.isModalInPresentation = true
        bottomSheet.modalPresentationStyle = .pageSheet

        if let sheet = bottomSheet.sheetPresentationController {
            sheet.detents = [
                .medium(),
                .large(),
            ]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.largestUndimmedDetentIdentifier = .medium
        }
    }
}
