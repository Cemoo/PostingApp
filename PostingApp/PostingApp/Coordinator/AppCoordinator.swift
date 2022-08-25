//
//  AppCoordinator.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 25.08.2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    // MARK: - Public Properties
    var navigationController: UINavigationController?
    
    private var postCoordinator: PostsCoordinator?
    private let window: UIWindow?
    
    // MARK: - Init
    init(with window: UIWindow?) {
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        guard let navigationController = navigationController else {
            return
        }
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        postCoordinator = PostsCoordinator(with: navigationController)
        postCoordinator?.start()
    }
}
