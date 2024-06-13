//
//  SceneDelegate.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let greetingViewController = GreetingViewController()
        let navigationController = UINavigationController(rootViewController: greetingViewController)

        greetingViewController.onShowNextViewController = { [weak self] in
            let mainFeatureViewController = MainFeatureViewController()
            let viewModel = MainFeatureViewModel()
            mainFeatureViewController.viewModel = viewModel
            let view = CustomBackButton.create(action: self?.popToRoot(viewController: mainFeatureViewController))
            mainFeatureViewController.navigationItem.hidesBackButton = true
            mainFeatureViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
            navigationController.pushViewController(mainFeatureViewController, animated: true)
        }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    private func popToRoot(viewController: UIViewController) -> () -> Void {
        { [weak viewController] in
            viewController?.navigationController?.popToRootViewController(animated: true)
        }
    }

    func sceneDidDisconnect(_: UIScene) {}

    func sceneDidBecomeActive(_: UIScene) {}

    func sceneWillResignActive(_: UIScene) {}

    func sceneWillEnterForeground(_: UIScene) {}

    func sceneDidEnterBackground(_: UIScene) {}
}
