//
//  SwipeCloseNavigationControllerViewController.swift
//  iOS
//
//  Created by Лолита Чернышева on 08.01.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import UIKit

class SwipeCloseNavigationControllerViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    let interactiveTransition = SwipeCloseInteractiveTransition()

    func navigationController(_ navigationController: UINavigationController,
                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning)
                              -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController)
                              -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            self.interactiveTransition.viewController = toVC
            return RotatePushAnimator()
        } else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransition.viewController = toVC
            }
            return RotatePopAnimator()
        }
        return nil
    }

}
