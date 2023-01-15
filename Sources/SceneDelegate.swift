//
//  SceneDelegate.swift
//  GuessTheNumberSimpleApp
//
//  Created by And Nik on 13.01.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let mainVC = ViewController()
        
        guard let windowScene  = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
    }

}

