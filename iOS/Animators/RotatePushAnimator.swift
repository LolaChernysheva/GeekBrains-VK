//
//  RotatePushAnimator.swift
//  iOS
//
//  Created by Лолита Чернышева on 08.01.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import UIKit

class RotatePushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    //получаем текущий и следующий view controller:

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let destination = transitionContext.viewController(forKey: .to) else {
            return
        }
        //добавляем следующий view controller в контейнер и задаем начальные frame и transform
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
        //удаляем текущий VC
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    //следующий VC немного увеличивается и накрывает текущий
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                           let translation = CGAffineTransform(translationX: -200, y: 0)
                                                           let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                                           source.view.transform = translation.concatenating(scale)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                           let translation = CGAffineTransform(translationX: source.view.frame.width / 2, y: 0)
                                                           let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                                                           destination.view.transform = translation.concatenating(scale)
                                    })
                                    //второй VC полностью накрывает текущий
                                    UIView.addKeyframe(withRelativeStartTime: 0.6,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                           destination.view.transform = .identity
                                    })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            //возвращаем текущему view прежнюю трансформацию, если анимация закончилась и переход не был отменен
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }

    }
    
    

}
