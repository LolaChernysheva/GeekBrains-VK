//
//  RotateVC.swift
//  iOS
//
//  Created by Лолита Чернышева on 08.01.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import UIKit

class RotateVC: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return CustomPushAnimator()
        } else if operation == .pop {
            return CustomPopAnimator()
        }
        return nil
    }


}
