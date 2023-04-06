//
//  HomeViewController.swift
//  SeniorProbApp
//
//  Created by Christopher Davis on 4/6/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home"

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"),
                                                          style: .done,
                                                          target: self,
                                                          action: #selector(didTapMenuButton))
    }
    
    @objc func didTapMenuButton() {
        
    }
    
}
