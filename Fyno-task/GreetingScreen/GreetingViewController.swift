//
//  GreetingViewController.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 13.06.2024.
//

import UIKit

final class GreetingViewController: UIViewController {
    var onShowNextViewController: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
    }

    private func setupButton() {
        let buttonAction = UIAction { _ in
            self.onShowNextViewController?()
        }

        let greetingButton = UIButton(type: .system, primaryAction: buttonAction)
        greetingButton.frame = view.bounds
        greetingButton.setTitle("Tap Anywhere to Discover", for: .normal)
        greetingButton.backgroundColor = .white
        greetingButton.setTitleColor(.black, for: .normal)
        view.addSubview(greetingButton)
    }
}
