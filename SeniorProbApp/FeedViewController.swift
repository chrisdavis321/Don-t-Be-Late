//
//  FeedViewController.swift
//  SeniorProbApp
//
//  Created by Christopher Davis on 2/21/23.
//

import UIKit

class FeedViewController: UIViewController {

    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addChildVCs()
    }
    
    private func addChildVCs() {
        //Menu
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
    
        //Home
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        
    }
}

extension FeedViewController: HomeViewControllerDelegate {
    func didTapMenuButton() {
        //Animate the menu
        print("did tap menu")
    }
}
