//
//  FeedViewController.swift
//  SeniorProbApp
//
//  Created by Christopher Davis on 2/21/23.
//

import UIKit

class FeedViewController: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed

    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    var navVC: UINavigationController?
    lazy var infoVC = InfoViewController()
    lazy var jamesVC = JamesDViewController()
    lazy var nsobVC = NSoBViewController()
    lazy var rdmVC = RDMorrisonViewController()
    lazy var vmcVC = VMCViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addChildVCs()
    }
    
    private func addChildVCs() {
        //Menu
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
    
        //Home
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
}

extension FeedViewController: HomeViewControllerDelegate {
    func didTapMenuButton() {
        toggleMenu(completion: nil)
    }
    
    func toggleMenu(completion: (() -> Void)?) {
        switch menuState {
        case .closed:
            //open it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100
                
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened

                }
            }

        case .opened:
            //close it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                
                self.navVC?.view.frame.origin.x = 0
                
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}

extension FeedViewController: MenuViewControllerDelegate {
   
    func didSelect(menuItem: MenuViewController.MenuOptions) {
        toggleMenu(completion: nil)
        switch menuItem {
        case .home:
            self.resetToHome()
        case .info:
            //Add info child
            self.addInfo()
        case .jamesD:
            self.addJames()
        case .nsoB:
            self.addNSoB()
        case .rdM:
            self.addRDM()
        case .vmC:
            self.addVMC()
        }        
    }
  
    func addInfo() {
        let vc = infoVC
        
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func resetToHome() {
        infoVC.view.removeFromSuperview()
        infoVC.didMove(toParent: nil)
        homeVC.title = "Home"
    }
    
    func addJames() {
        let vc = jamesVC
        
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addNSoB() {
        let vc = nsobVC
        
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addRDM() {
        let vc = rdmVC
        
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addVMC() {
        let vc = vmcVC
        
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
}
